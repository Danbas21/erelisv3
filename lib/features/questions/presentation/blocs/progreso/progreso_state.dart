part of 'progreso_bloc.dart';

/// Estados posibles para el progreso del examen.
@freezed
class ProgresoState with _$ProgresoState {
  /// Estado inicial.
  const factory ProgresoState.inicial() = Inicial;

  /// Estado durante la ejecución del examen.
  const factory ProgresoState.enCurso({
    required String examenId,
    required String usuarioId,
    required int totalPreguntas,
    required int preguntasRespondidas,
    required int tiempoRestantes,
    required Map<String, String> respuestas,
    DateTime? ultimoGuardado,
    String? errorGuardado,
  }) = EnCursoP;

  /// Estado cuando se ha agotado el tiempo.
  const factory ProgresoState.tiempoAgotado({
    required String examenId,
    required String usuarioId,
    required int totalPreguntas,
    required int preguntasRespondidas,
    required Map<String, String> respuestas,
  }) = TiempoAgotado;
}
