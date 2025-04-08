import 'package:erelis/features/questions/data/models/opcion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/pregunta_entity.dart';

part 'pregunta_model.freezed.dart';
part 'pregunta_model.g.dart';

/// Modelo de datos para representar una pregunta en la capa de datos.
@freezed
sealed class PreguntaModel with _$PreguntaModel {
  const PreguntaModel._();

  const factory PreguntaModel({
    required String id,
    required String texto,
    required String tipo,
    required int puntos,
    required List<OpcionModel> opciones,
    required String explicacion,
    required int orden,
    String? respuestaSeleccionada,
  }) = _PreguntaModel;

  /// Crea un modelo a partir de un mapa JSON.
  factory PreguntaModel.fromJson(Map<String, dynamic> json) =>
      _$PreguntaModelFromJson(json);

  /// Crea un modelo a partir de un documento de Firestore.
  factory PreguntaModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    return PreguntaModel.fromJson({...data, 'id': doc.id});
  }

  /// Convierte el modelo a un mapa para Firestore.
  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove(
      'id',
    ); // Eliminamos el ID para que Firestore genere o use el existente
    return json;
  }

  /// Convierte el modelo a una entidad de dominio.
  PreguntaEntity toEntity() => PreguntaEntity(
    id: id,
    texto: texto,
    tipo: tipo,
    puntos: puntos,
    opciones: opciones.map((opcion) => opcion.toEntity()).toList(),
    explicacion: explicacion,
    orden: orden,
    respuestaSeleccionada: respuestaSeleccionada,
  );

  /// Crea un modelo a partir de una entidad de dominio.
  factory PreguntaModel.fromEntity(PreguntaEntity entity) => PreguntaModel(
    id: entity.id,
    texto: entity.texto,
    tipo: entity.tipo,
    puntos: entity.puntos,
    opciones:
        entity.opciones
            .map((opcion) => OpcionModel.fromEntity(opcion))
            .toList(),
    explicacion: entity.explicacion,
    orden: entity.orden,
    respuestaSeleccionada: entity.respuestaSeleccionada,
  );
}
