import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'progreso_examen_model.freezed.dart';
part 'progreso_examen_model.g.dart';

/// Modelo para representar el progreso de un usuario en un examen.
@freezed
sealed class ProgresoExamenModel with _$ProgresoExamenModel {
  const ProgresoExamenModel._();

  const factory ProgresoExamenModel({
    required String examenId,
    required String usuarioId,
    required Map<String, String> respuestas,
    required int preguntaActual,
    required bool completado,
    required DateTime ultimaModificacion,
    int? puntajeObtenido,
  }) = _ProgresoExamenModel;

  /// Crea un modelo a partir de un mapa JSON.
  factory ProgresoExamenModel.fromJson(Map<String, dynamic> json) =>
      _$ProgresoExamenModelFromJson(json);

  /// Crea un modelo a partir de un documento de Firestore.
  factory ProgresoExamenModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};

    // Convertimos el timestamp de Firestore a DateTime
    final ultimaModificacion =
        (data['ultimaModificacion'] as Timestamp).toDate();

    // Convertimos el mapa de respuestas
    final respuestasData = data['respuestas'] as Map<String, dynamic>? ?? {};
    final respuestas = respuestasData.map(
      (key, value) => MapEntry(key, value.toString()),
    );

    return ProgresoExamenModel(
      examenId: data['examenId'] as String? ?? '',
      usuarioId: data['usuarioId'] as String? ?? '',
      respuestas: respuestas,
      preguntaActual: data['preguntaActual'] as int? ?? 0,
      completado: data['completado'] as bool? ?? false,
      ultimaModificacion: ultimaModificacion,
      puntajeObtenido: data['puntajeObtenido'] as int?,
    );
  }

  /// Convierte el modelo a un mapa para Firestore.
  Map<String, dynamic> toFirestore() {
    final json = toJson();

    // Aseguramos que la fecha sea Timestamp
    json['ultimaModificacion'] = Timestamp.fromDate(ultimaModificacion);

    return json;
  }

  /// Convierte el modelo a una entidad de dominio.
  ProgresoExamenEntity toEntity() => ProgresoExamenEntity(
    examenId: examenId,
    usuarioId: usuarioId,
    respuestas: respuestas,
    preguntaActual: preguntaActual,
    completado: completado,
    ultimaModificacion: ultimaModificacion,
    puntajeObtenido: puntajeObtenido,
  );

  /// Crea un modelo a partir de una entidad de dominio.
  factory ProgresoExamenModel.fromEntity(ProgresoExamenEntity entity) =>
      ProgresoExamenModel(
        examenId: entity.examenId,
        usuarioId: entity.usuarioId,
        respuestas: entity.respuestas,
        preguntaActual: entity.preguntaActual,
        completado: entity.completado,
        ultimaModificacion: entity.ultimaModificacion,
        puntajeObtenido: entity.puntajeObtenido,
      );
}
