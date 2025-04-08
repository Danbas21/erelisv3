/// Modelo de datos para representar una opción de respuesta.
///
import 'package:erelis/features/questions/domain/entities/option_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opcion_model.freezed.dart';
part 'opcion_model.g.dart';

@freezed
sealed class OpcionModel with _$OpcionModel {
  const OpcionModel._();

  const factory OpcionModel({required String texto, required bool esCorrecta}) =
      _OpcionModel;

  factory OpcionModel.fromJson(Map<String, dynamic> json) =>
      _$OpcionModelFromJson(json);

  /// Convierte el modelo a una entidad de dominio.
  OpcionEntity toEntity() => OpcionEntity(texto: texto, esCorrecta: esCorrecta);

  /// Crea un modelo a partir de una entidad de dominio.
  factory OpcionModel.fromEntity(OpcionEntity entity) =>
      OpcionModel(texto: entity.texto, esCorrecta: entity.esCorrecta);
}
