import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progreso_state.dart';
part 'progreso_event.dart';
part 'progreso_bloc.freezed.dart';

/// BLoC para manejar el progreso y temporizador del examen.
class ProgresoBloc extends Bloc<ProgresoEvent, ProgresoState> {
  final ExamenRepository _examenRepository;
  Timer? _timer;

  ProgresoBloc({required ExamenRepository examenRepository})
    : _examenRepository = examenRepository,
      super(const ProgresoState.inicial()) {
    on<ProgresoIniciado>(_onProgresoIniciado);
    on<TiempoActualizado>(_onTiempoActualizado);
    on<ProgresoGuardado>(_onProgresoGuardado);
    on<PreguntaRespondida>(_onPreguntaRespondida);
  }

  /// Maneja el evento de iniciar el progreso.
  Future<void> _onProgresoIniciado(
    ProgresoIniciado event,
    Emitter<ProgresoState> emit,
  ) async {
    // Cancelamos cualquier timer existente
    _timer?.cancel();

    emit(
      ProgresoState.enCurso(
        examenId: event.examenId,
        usuarioId: event.usuarioId,
        totalPreguntas: event.totalPreguntas,
        preguntasRespondidas: event.respuestas.length,
        tiempoRestantes: event.tiempoTotalSegundos,
        respuestas: event.respuestas,
      ),
    );

    // Iniciamos el temporizador si el tiempo es mayor a cero
    if (event.tiempoTotalSegundos > 0) {
      _iniciarTemporizador(event.tiempoTotalSegundos, emit);
    }
  }

  /// Maneja el evento de actualización de tiempo.
  void _onTiempoActualizado(
    TiempoActualizado event,
    Emitter<ProgresoState> emit,
  ) {
    final currentState = state;
    if (currentState is! EnCursoP) {
      return;
    }

    // Si el tiempo llega a cero, cambiamos al estado de tiempo agotado
    if (event.segundosRestantes <= 0) {
      _timer?.cancel();
      emit(
        ProgresoState.tiempoAgotado(
          examenId: currentState.examenId,
          usuarioId: currentState.usuarioId,
          totalPreguntas: currentState.totalPreguntas,
          preguntasRespondidas: currentState.preguntasRespondidas,
          respuestas: currentState.respuestas,
        ),
      );

      // Guardamos el progreso automáticamente
      add(
        ProgresoEvent.guardado(
          examenId: currentState.examenId,
          usuarioId: currentState.usuarioId,
          respuestas: currentState.respuestas,
          preguntaActual: currentState.preguntasRespondidas,
          completado: true,
        ),
      );
    } else {
      // Actualizamos el tiempo restante
      emit(currentState.copyWith(tiempoRestantes: event.segundosRestantes));
    }
  }

  /// Maneja el evento de guardar progreso.
  Future<void> _onProgresoGuardado(
    ProgresoGuardado event,
    Emitter<ProgresoState> emit,
  ) async {
    final currentState = state;
    if (currentState is! EnCursoP && currentState is! TiempoAgotado) {
      return;
    }

    // Creamos una entidad de progreso
    final progreso = ProgresoExamenEntity(
      examenId: event.examenId,
      usuarioId: event.usuarioId,
      respuestas: event.respuestas,
      preguntaActual: event.preguntaActual,
      completado: event.completado,
      ultimaModificacion: DateTime.now(),
    );

    // Guardamos el progreso usando el repositorio
    final resultado = await _examenRepository.guardarProgreso(progreso);

    resultado.fold(
      (failure) {
        // Si estamos en un estado de curso, actualizamos con el error
        if (currentState is EnCursoP) {
          emit(
            currentState.copyWith(
              errorGuardado: 'Error al guardar: ${failure.mensaje}',
            ),
          );
        }
      },
      (_) {
        // Si estamos en un estado de curso, actualizamos el mensaje de guardado
        if (currentState is EnCursoP) {
          emit(
            currentState.copyWith(
              ultimoGuardado: DateTime.now(),
              errorGuardado: null,
            ),
          );
        }
      },
    );
  }

  /// Maneja el evento de responder una pregunta.
  void _onPreguntaRespondida(
    PreguntaRespondida event,
    Emitter<ProgresoState> emit,
  ) {
    final currentState = state;
    if (currentState is! EnCursoP) {
      return;
    }

    // Actualizamos las respuestas y el contador
    final nuevasRespuestas = Map<String, String>.from(currentState.respuestas);
    nuevasRespuestas[event.preguntaId] = event.respuesta;

    emit(
      currentState.copyWith(
        preguntasRespondidas: nuevasRespuestas.length,
        respuestas: nuevasRespuestas,
      ),
    );

    // Guardamos el progreso automáticamente
    add(
      ProgresoEvent.guardado(
        examenId: currentState.examenId,
        usuarioId: currentState.usuarioId,
        respuestas: nuevasRespuestas,
        preguntaActual: event.indicePreguntaActual,
        completado: false,
      ),
    );
  }

  /// Inicia el temporizador para el examen.
  void _iniciarTemporizador(int segundosTotales, Emitter<ProgresoState> emit) {
    _timer?.cancel();
    int segundosRestantes = segundosTotales;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      segundosRestantes--;
      add(
        ProgresoEvent.tiempoActualizado(segundosRestantes: segundosRestantes),
      );
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
