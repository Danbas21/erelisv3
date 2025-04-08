/// Entidad que representa una opción de respuesta para una pregunta.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_entity.freezed.dart';

@freezed
sealed class OpcionEntity with _$OpcionEntity {
  const factory OpcionEntity({
    required String texto,
    required bool esCorrecta,
  }) = _OpcionEntity;
}
