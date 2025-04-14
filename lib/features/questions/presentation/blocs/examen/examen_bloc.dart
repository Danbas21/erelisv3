import 'package:bloc/bloc.dart';
import 'package:erelis/features/questions/domain/entities/examen_entity.dart';
import 'package:erelis/features/questions/domain/entities/pregunta_entity.dart';
import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'examen_state.dart';
part 'examen_event.dart';
part 'examen_bloc.freezed.dart';

/// BLoC que maneja la lógica de un examen en curso.
class ExamenBloc extends Bloc<ExamenEvent, ExamenState> {
  final ExamenRepository _examenRepository;

  ExamenBloc({required ExamenRepository examenRepository})
    : _examenRepository = examenRepository,
      super(const ExamenState.inicial()) {
    on<_ExamenIniciado>(_onExamenIniciado);
    on<_PreguntaCambiada>(_onPreguntaCambiada);
    on<_RespuestaSeleccionada>(_onRespuestaSeleccionada);
    on<_ProgresoGuardadoExamen>(_onProgresoGuardadoExamen);
    on<_ExamenFinalizado>(_onExamenFinalizado);
    on<_ProgresoRecuperado>(_onProgresoRecuperado);
  }

  /// Maneja el evento de inicio de examen, cargando la primera pregunta.
  Future<void> _onExamenIniciado(
    _ExamenIniciado event,
    Emitter<ExamenState> emit,
  ) async {
    emit(const ExamenState.cargando());

    print("Iniciando examen con ID: ${event.examenId}");

    // Obtener el examen
    final examenResult = await _examenRepository.obtenerExamen(event.examenId);

    examenResult.fold(
      (failure) {
        print("Error al obtener el examen: ${failure.mensaje}");
        emit(ExamenState.error(mensaje: failure.mensaje));
      },
      (examen) {
        print(
          "Examen cargado con éxito. Preguntas: ${examen.preguntas.length}",
        );

        if (examen.preguntas.isEmpty) {
          print("El examen no tiene preguntas");
          emit(
            const ExamenState.error(mensaje: 'El examen no tiene preguntas'),
          );
          return;
        }

        // Iniciamos con la primera pregunta
        final preguntaActual = examen.preguntas.first;

        print("Primera pregunta: ${preguntaActual.texto}");

        emit(
          ExamenState.enCurso(
            examen: examen,
            preguntaActual: preguntaActual,
            indicePreguntaActual: 0,
            respuestas: const {},
            tiempoRestante: examen.tiempoLimiteMinutos * 60, // en segundos
          ),
        );
      },
    );
  }

  /// Maneja el evento de cambio de pregunta.
  Future<void> _onPreguntaCambiada(
    _PreguntaCambiada event,
    Emitter<ExamenState> emit,
  ) async {
    // Solo procedemos si estamos en estado "enCurso"
    final currentState = state;
    if (currentState is! EnCurso) {
      return;
    }

    // Verificamos que el índice esté dentro de los límites
    if (event.nuevaIndice < 0 ||
        event.nuevaIndice >= currentState.examen.preguntas.length) {
      return;
    }

    // Obtenemos la nueva pregunta según el índice
    final nuevaPregunta = currentState.examen.preguntas[event.nuevaIndice];

    emit(
      currentState.copyWith(
        preguntaActual: nuevaPregunta,
        indicePreguntaActual: event.nuevaIndice,
      ),
    );
  }

  /// Maneja el evento de selección de respuesta.
  Future<void> _onRespuestaSeleccionada(
    _RespuestaSeleccionada event,
    Emitter<ExamenState> emit,
  ) async {
    // Solo procedemos si estamos en estado "enCurso"
    final currentState = state;
    if (currentState is! EnCurso) {
      return;
    }

    // Actualizamos el mapa de respuestas con la nueva respuesta
    final nuevasRespuestas = Map<String, String>.from(currentState.respuestas);
    nuevasRespuestas[event.preguntaId] = event.respuesta;

    emit(currentState.copyWith(respuestas: nuevasRespuestas));

    // Guardamos el progreso automáticamente
    add(
      _ProgresoGuardadoExamen(
        examenId: currentState.examen.id,
        usuarioId: event.usuarioId,
      ),
    );
  }

  /// Maneja el evento de guardar progreso.
  Future<void> _onProgresoGuardadoExamen(
    _ProgresoGuardadoExamen event,
    Emitter<ExamenState> emit,
  ) async {
    // Solo procedemos si estamos en estado "enCurso"
    final currentState = state;
    if (currentState is! EnCurso) {
      return;
    }

    // Creamos una entidad de progreso
    final progreso = ProgresoExamenEntity(
      examenId: event.examenId,
      usuarioId: event.usuarioId,
      respuestas: currentState.respuestas,
      preguntaActual: currentState.indicePreguntaActual,
      completado: false,
      ultimaModificacion: DateTime.now(),
    );

    // Guardamos el progreso usando el repositorio
    final resultado = await _examenRepository.guardarProgreso(progreso);

    resultado.fold(
      (failure) => emit(
        ExamenState.error(
          mensaje: 'Error al guardar progreso: ${failure.mensaje}',
        ),
      ),
      (_) => null, // No cambiamos el estado, solo guardamos silenciosamente
    );
  }

  /// Maneja el evento de finalizar examen.
  Future<void> _onExamenFinalizado(
    _ExamenFinalizado event,
    Emitter<ExamenState> emit,
  ) async {
    // Solo procedemos si estamos en estado "enCurso"
    final currentState = state;
    if (currentState is! EnCurso) {
      return;
    }

    emit(const ExamenState.cargando());

    // Finalizamos el examen y obtenemos el puntaje
    final resultado = await _examenRepository.finalizarExamen(
      currentState.examen.id,
      event.usuarioId,
      currentState.respuestas,
    );

    resultado.fold(
      (failure) => emit(
        ExamenState.error(
          mensaje: 'Error al finalizar examen: ${failure.mensaje}',
        ),
      ),
      (puntaje) {
        // Calculamos el total de preguntas y correctas
        final totalPreguntas = currentState.examen.preguntas.length;
        final preguntasRespondidas = currentState.respuestas.length;

        // Calculamos las respuestas correctas
        int respuestasCorrectas = 0;
        for (final pregunta in currentState.examen.preguntas) {
          final respuestaUsuario = currentState.respuestas[pregunta.id];
          if (respuestaUsuario != null &&
              _examenRepository.verificarRespuesta(
                pregunta,
                respuestaUsuario,
              )) {
            respuestasCorrectas++;
          }
        }

        emit(
          ExamenState.finalizado(
            examen: currentState.examen,
            puntajeObtenido: puntaje,
            respuestas: currentState.respuestas,
            totalPreguntas: totalPreguntas,
            preguntasRespondidas: preguntasRespondidas,
            respuestasCorrectas: respuestasCorrectas,
          ),
        );
      },
    );
  }

  /// Maneja el evento de recuperar progreso previo.
  Future<void> _onProgresoRecuperado(
    _ProgresoRecuperado event,
    Emitter<ExamenState> emit,
  ) async {
    emit(const ExamenState.cargando());

    // Obtenemos el examen completo
    final examenResult = await _examenRepository.obtenerExamen(event.examenId);

    examenResult.fold(
      (failure) => emit(ExamenState.error(mensaje: failure.mensaje)),
      (examen) {
        // Determinamos la pregunta actual según el progreso
        final indicePregunta = event.progreso.preguntaActual.clamp(
          0,
          examen.preguntas.length - 1,
        );
        final preguntaActual = examen.preguntas[indicePregunta];

        // Si el examen estaba completado, mostramos resultados
        if (event.progreso.completado &&
            event.progreso.puntajeObtenido != null) {
          // Calculamos las respuestas correctas
          int respuestasCorrectas = 0;
          for (final pregunta in examen.preguntas) {
            final respuestaUsuario = event.progreso.respuestas[pregunta.id];
            if (respuestaUsuario != null &&
                _examenRepository.verificarRespuesta(
                  pregunta,
                  respuestaUsuario,
                )) {
              respuestasCorrectas++;
            }
          }

          emit(
            ExamenState.finalizado(
              examen: examen,
              puntajeObtenido: event.progreso.puntajeObtenido!,
              respuestas: event.progreso.respuestas,
              totalPreguntas: examen.preguntas.length,
              preguntasRespondidas: event.progreso.respuestas.length,
              respuestasCorrectas: respuestasCorrectas,
            ),
          );
        } else {
          // Continuamos el examen desde donde se quedó
          emit(
            ExamenState.enCurso(
              examen: examen,
              preguntaActual: preguntaActual,
              indicePreguntaActual: indicePregunta,
              respuestas: event.progreso.respuestas,
              tiempoRestante:
                  examen.tiempoLimiteMinutos *
                  60, // Reiniciamos el tiempo por simplicidad
            ),
          );
        }
      },
    );
  }
}
