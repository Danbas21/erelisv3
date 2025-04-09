part of 'examen_bloc.dart';

/// Eventos relacionados con el flujo de examen.
@freezed
sealed class ExamenEvent with _$ExamenEvent {
  /// Evento para iniciar un examen.
  const factory ExamenEvent.iniciado({
    required String examenId,
    required String usuarioId,
  }) = ExamenIniciado;

  /// Evento para cambiar a una pregunta específica.
  const factory ExamenEvent.preguntaCambiada({required int nuevaIndice}) =
      PreguntaCambiada;

  /// Evento para seleccionar una respuesta.
  const factory ExamenEvent.respuestaSeleccionada({
    required String preguntaId,
    required String respuesta,
    required String usuarioId,
  }) = RespuestaSeleccionada;

  /// Evento para guardar el progreso actual.
  const factory ExamenEvent.progresoGuardado({
    required String examenId,
    required String usuarioId,
  }) = ProgresoGuardadoExamen;

  /// Evento para finalizar el examen y calcular resultados.
  const factory ExamenEvent.finalizado({required String usuarioId}) =
      ExamenFinalizado;

  /// Evento para recuperar un progreso previo.
  const factory ExamenEvent.progresoRecuperado({
    required String examenId,
    required String usuarioId,
    required ProgresoExamenEntity progreso,
  }) = ProgresoRecuperado;
}
