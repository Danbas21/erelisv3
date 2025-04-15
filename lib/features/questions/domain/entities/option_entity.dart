/// Entidad que representa una opción de respuesta para una pregunta.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_entity.freezed.dart';

@freezed
sealed class OpcionEntity with _$OpcionEntity {
  const factory OpcionEntity({
    required String texto,
    required bool esCorrecta,
    final String? explicacion,
  }) = _OpcionEntity;
}
