// examen_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:erelis/features/questions/domain/entities/examen_entity.dart';
import 'package:erelis/features/questions/domain/entities/pregunta_entity.dart';
import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'examen_state.dart';
part 'examen_event.dart';
part 'examen_bloc.freezed.dart';

class ExamenBloc extends Bloc<ExamenEvent, ExamenState> {
  final ExamenRepository _examenRepository;

  ExamenBloc({required ExamenRepository examenRepository})
    : _examenRepository = examenRepository,
      super(const ExamenState.inicial()) {
    on<ExamenEvent>((event, emit) async {
      switch (event) {
        case _ExamenIniciado(:final examenId):
          emit(const ExamenState.cargando());
          final examenResult = await _examenRepository.obtenerExamen(examenId);
          examenResult.fold(
            (failure) => emit(ExamenState.error(mensaje: failure.mensaje)),
            (examen) {
              if (examen.preguntas.isEmpty) {
                emit(
                  const ExamenState.error(
                    mensaje: 'El examen no tiene preguntas',
                  ),
                );
                return;
              }
              emit(
                ExamenState.enCurso(
                  examen: examen,
                  preguntaActual: examen.preguntas.first,
                  indicePreguntaActual: 0,
                  respuestas: const {},
                  tiempoRestante: examen.tiempoLimiteMinutos * 60,
                ),
              );
            },
          );
          break;

        case _PreguntaCambiada(:final nuevaIndice):
          final currentState = state;
          if (currentState is! EnCurso) return;
          if (nuevaIndice < 0 ||
              nuevaIndice >= currentState.examen.preguntas.length) {
            return;
          }
          emit(
            currentState.copyWith(
              preguntaActual: currentState.examen.preguntas[nuevaIndice],
              indicePreguntaActual: nuevaIndice,
            ),
          );
          break;

        case _RespuestaSeleccionada(
          :final preguntaId,
          :final respuesta,
          :final usuarioId,
        ):
          final currentState = state;
          if (currentState is! EnCurso) return;
          final nuevasRespuestas = Map<String, String>.from(
            currentState.respuestas,
          )..[preguntaId] = respuesta;
          emit(currentState.copyWith(respuestas: nuevasRespuestas));
          add(
            _ProgresoGuardadoExamen(
              examenId: currentState.examen.id,
              usuarioId: usuarioId,
            ),
          );
          break;

        case _ProgresoGuardadoExamen(:final examenId, :final usuarioId):
          final currentState = state;
          if (currentState is! EnCurso) return;
          final progreso = ProgresoExamenEntity(
            examenId: examenId,
            usuarioId: usuarioId,
            respuestas: currentState.respuestas,
            preguntaActual: currentState.indicePreguntaActual,
            completado: false,
            ultimaModificacion: DateTime.now(),
          );
          final resultado = await _examenRepository.guardarProgreso(progreso);
          resultado.fold(
            (failure) => emit(
              ExamenState.error(
                mensaje: 'Error al guardar progreso: ${failure.mensaje}',
              ),
            ),
            (_) => null,
          );
          break;

        case _ExamenFinalizado(:final usuarioId):
          final currentState = state;
          if (currentState is! EnCurso) return;
          emit(const ExamenState.cargando());
          final resultado = await _examenRepository.finalizarExamen(
            currentState.examen.id,
            usuarioId,
            currentState.respuestas,
          );
          resultado.fold(
            (failure) => emit(
              ExamenState.error(
                mensaje: 'Error al finalizar examen: ${failure.mensaje}',
              ),
            ),
            (puntaje) {
              final total = currentState.examen.preguntas.length;
              final respondidas = currentState.respuestas.length;
              final correctas =
                  currentState.examen.preguntas.where((p) {
                    final r = currentState.respuestas[p.id];
                    return r != null &&
                        _examenRepository.verificarRespuesta(p, r);
                  }).length;
              emit(
                ExamenState.finalizado(
                  examen: currentState.examen,
                  puntajeObtenido: puntaje,
                  respuestas: currentState.respuestas,
                  totalPreguntas: total,
                  preguntasRespondidas: respondidas,
                  respuestasCorrectas: correctas,
                ),
              );
            },
          );
          break;

        case _ProgresoRecuperado(:final examenId, :final progreso):
          emit(const ExamenState.cargando());
          final examenResult = await _examenRepository.obtenerExamen(examenId);
          examenResult.fold(
            (failure) => emit(ExamenState.error(mensaje: failure.mensaje)),
            (examen) {
              final index = progreso.preguntaActual.clamp(
                0,
                examen.preguntas.length - 1,
              );
              final actual = examen.preguntas[index];
              if (progreso.completado && progreso.puntajeObtenido != null) {
                final correctas =
                    examen.preguntas.where((p) {
                      final r = progreso.respuestas[p.id];
                      return r != null &&
                          _examenRepository.verificarRespuesta(p, r);
                    }).length;
                emit(
                  ExamenState.finalizado(
                    examen: examen,
                    puntajeObtenido: progreso.puntajeObtenido!,
                    respuestas: progreso.respuestas,
                    totalPreguntas: examen.preguntas.length,
                    preguntasRespondidas: progreso.respuestas.length,
                    respuestasCorrectas: correctas,
                  ),
                );
              } else {
                emit(
                  ExamenState.enCurso(
                    examen: examen,
                    preguntaActual: actual,
                    indicePreguntaActual: index,
                    respuestas: progreso.respuestas,
                    tiempoRestante: examen.tiempoLimiteMinutos * 60,
                  ),
                );
              }
            },
          );
          break;
      }
    });
  }
}
