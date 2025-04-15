// examen_state.dart
part of 'examen_bloc.dart';

@freezed
sealed class ExamenState with _$ExamenState {
  const factory ExamenState.inicial() = InicialExamen;

  const factory ExamenState.cargando() = Cargando;

  const factory ExamenState.enCurso({
    required ExamenEntity examen,
    required PreguntaEntity preguntaActual,
    required int indicePreguntaActual,
    required Map<String, String> respuestas,
    required int tiempoRestante,
  }) = EnCurso;

  const factory ExamenState.finalizado({
    required ExamenEntity examen,
    required int puntajeObtenido,
    required Map<String, String> respuestas,
    required int totalPreguntas,
    required int preguntasRespondidas,
    required int respuestasCorrectas,
  }) = Finalizado;

  const factory ExamenState.error({required String mensaje}) = Error;
}
