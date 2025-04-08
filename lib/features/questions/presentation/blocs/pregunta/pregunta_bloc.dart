import 'package:bloc/bloc.dart';
import 'package:erelis/features/questions/domain/entities/option_entity.dart';
import 'package:erelis/features/questions/domain/entities/pregunta_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pregunta_state.dart';
part 'pregunta_event.dart';
part 'pregunta_bloc.freezed.dart';

/// BLoC para manejar la interacción con una pregunta individual.
class PreguntaBloc extends Bloc<PreguntaEvent, PreguntaState> {
  PreguntaBloc() : super(const PreguntaState.inicial()) {
    on<PreguntaCargada>(_onPreguntaCargada);
    on<OpcionSeleccionada>(_onOpcionSeleccionada);
    on<RespuestaVerificada>(_onRespuestaVerificada);
    on<_TiempoAgotado>(_onTiempoAgotado);
  }

  /// Maneja el evento de cargar una pregunta.
  void _onPreguntaCargada(PreguntaCargada event, Emitter<PreguntaState> emit) {
    emit(
      PreguntaState.cargada(
        pregunta: event.pregunta,
        respuestaSeleccionada: event.respuestaPrevia,
        tiempoRestante: event.tiempoLimite,
      ),
    );
  }

  /// Maneja el evento de seleccionar una opción.
  void _onOpcionSeleccionada(
    OpcionSeleccionada event,
    Emitter<PreguntaState> emit,
  ) {
    final currentState = state;
    if (currentState is! Cargada) {
      return;
    }

    emit(currentState.copyWith(respuestaSeleccionada: event.opcion));
  }

  /// Maneja el evento de verificar una respuesta.
  void _onRespuestaVerificada(
    RespuestaVerificada event,
    Emitter<PreguntaState> emit,
  ) {
    final currentState = state;
    if (currentState is! Cargada ||
        currentState.respuestaSeleccionada == null) {
      return;
    }

    // Buscamos si la opción seleccionada es correcta
    final opcionSeleccionada = currentState.pregunta.opciones.firstWhere(
      (opcion) => opcion.texto == currentState.respuestaSeleccionada,
      orElse: () => const OpcionEntity(texto: '', esCorrecta: false),
    );

    emit(
      PreguntaState.respondida(
        pregunta: currentState.pregunta,
        respuestaSeleccionada: currentState.respuestaSeleccionada!,
        esCorrecta: opcionSeleccionada.esCorrecta,
      ),
    );
  }

  /// Maneja el evento de tiempo agotado.
  void _onTiempoAgotado(_TiempoAgotado event, Emitter<PreguntaState> emit) {
    final currentState = state;
    if (currentState is! Cargada) {
      return;
    }

    emit(
      PreguntaState.tiempoAgotado(
        pregunta: currentState.pregunta,
        respuestaSeleccionada: currentState.respuestaSeleccionada,
      ),
    );
  }
}
