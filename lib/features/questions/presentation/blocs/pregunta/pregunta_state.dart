part of 'pregunta_bloc.dart';

/// Estados posibles para la interacción con una pregunta.
@freezed
sealed class PreguntaState with _$PreguntaState {
  /// Estado inicial antes de cargar la pregunta.
  const factory PreguntaState.inicial() = Inicial;

  /// Estado cuando la pregunta está cargada y puede ser respondida.
  const factory PreguntaState.cargada({
    required PreguntaEntity pregunta,
    String? respuestaSeleccionada,
    required int tiempoRestante,
  }) = Cargada;

  /// Estado cuando la pregunta ha sido respondida.
  const factory PreguntaState.respondida({
    required PreguntaEntity pregunta,
    required String respuestaSeleccionada,
    required bool esCorrecta,
  }) = Respondida;

  /// Estado cuando se ha agotado el tiempo para responder.
  const factory PreguntaState.tiempoAgotado({
    required PreguntaEntity pregunta,
    String? respuestaSeleccionada,
  }) = TiempoAgotado;
}
