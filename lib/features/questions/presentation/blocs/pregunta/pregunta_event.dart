part of 'pregunta_bloc.dart';

/// Eventos relacionados con la interacción con una pregunta.
@freezed
sealed class PreguntaEvent with _$PreguntaEvent {
  /// Evento para cargar una pregunta.
  const factory PreguntaEvent.cargada({
    required PreguntaEntity pregunta,
    String? respuestaPrevia,
    @Default(60) int tiempoLimite, // tiempo en segundos
  }) = PreguntaCargada;

  /// Evento para seleccionar una opción como respuesta.
  const factory PreguntaEvent.opcionSeleccionada({required String opcion}) =
      OpcionSeleccionada;

  /// Evento para verificar si la respuesta seleccionada es correcta.
  const factory PreguntaEvent.respuestaVerificada() = RespuestaVerificada;

  /// Evento para cuando se agota el tiempo límite.
  const factory PreguntaEvent.tiempoAgotado() = _TiempoAgotado;
}
