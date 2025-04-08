part of 'examen_bloc.dart';

/// Estados posibles para el flujo de examen.
@freezed
sealed class ExamenState with _$ExamenState {
  /// Estado inicial antes de cargar el examen.
  const factory ExamenState.inicial() = Inicial;

  /// Estado durante la carga del examen o procesamiento.
  const factory ExamenState.cargando() = Cargando;

  /// Estado cuando el examen está en curso.
  const factory ExamenState.enCurso({
    required ExamenEntity examen,
    required PreguntaEntity preguntaActual,
    required int indicePreguntaActual,
    required Map<String, String> respuestas,
    required int tiempoRestante, // en segundos
  }) = EnCurso;

  /// Estado cuando el examen ha finalizado y se muestran los resultados.
  const factory ExamenState.finalizado({
    required ExamenEntity examen,
    required int puntajeObtenido,
    required Map<String, String> respuestas,
    required int totalPreguntas,
    required int preguntasRespondidas,
    required int respuestasCorrectas,
  }) = Finalizado;

  /// Estado de error.
  const factory ExamenState.error({required String mensaje}) = Error;
}
