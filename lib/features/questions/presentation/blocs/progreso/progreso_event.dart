part of 'progreso_bloc.dart';

/// Eventos relacionados con el progreso del examen.
@freezed
class ProgresoEvent with _$ProgresoEvent {
  /// Evento para iniciar el seguimiento del progreso.
  const factory ProgresoEvent.iniciado({
    required String examenId,
    required String usuarioId,
    required int totalPreguntas,
    required Map<String, String> respuestas,
    required int tiempoTotalSegundos,
  }) = ProgresoIniciado;

  /// Evento para actualizar el tiempo restante.
  const factory ProgresoEvent.tiempoActualizado({
    required int segundosRestantes,
  }) = TiempoActualizado;

  /// Evento para guardar el progreso actual.
  const factory ProgresoEvent.guardado({
    required String examenId,
    required String usuarioId,
    required Map<String, String> respuestas,
    required int preguntaActual,
    required bool completado,
  }) = ProgresoGuardado;

  /// Evento para registrar una pregunta respondida.
  const factory ProgresoEvent.preguntaRespondida({
    required String preguntaId,
    required String respuesta,
    required int indicePreguntaActual,
  }) = PreguntaRespondida;
}
