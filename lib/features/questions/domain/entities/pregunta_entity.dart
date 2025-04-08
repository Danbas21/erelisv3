import 'package:erelis/features/questions/domain/entities/option_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pregunta_entity.freezed.dart';

/// Entidad que representa una pregunta de examen en el dominio de la aplicación.
@freezed
sealed class PreguntaEntity with _$PreguntaEntity {
  const factory PreguntaEntity({
    required String id,
    required String texto,
    required String tipo,
    required int puntos,
    required List<OpcionEntity> opciones,
    required String explicacion,
    required int orden,
    String? respuestaSeleccionada,
  }) = _PreguntaEntity;
}
