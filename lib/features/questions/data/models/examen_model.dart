import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/examen_entity.dart';
import 'pregunta_model.dart';

part 'examen_model.freezed.dart';
part 'examen_model.g.dart';

/// Modelo de datos para representar un examen completo.
@freezed
sealed class ExamenModel with _$ExamenModel {
  const ExamenModel._();

  const factory ExamenModel({
    required String id,
    required String titulo,
    required List<PreguntaModel> preguntas,
    required DateTime fechaCreacion,
    DateTime? fechaFinalizacion,
    required int tiempoLimiteMinutos,
    required bool completado,
    required int puntajeTotal,
    required int puntajeObtenido,
  }) = _ExamenModel;

  /// Crea un modelo a partir de un mapa JSON.
  factory ExamenModel.fromJson(Map<String, dynamic> json) =>
      _$ExamenModelFromJson(json);

  /// Crea un modelo a partir de un documento de Firestore.
  factory ExamenModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};

    // Convertimos los timestamps de Firestore a DateTime
    final fechaCreacion = (data['fechaCreacion'] as Timestamp).toDate();
    final fechaFinalizacion =
        data['fechaFinalizacion'] != null
            ? (data['fechaFinalizacion'] as Timestamp).toDate()
            : null;

    // Convertimos las preguntas
    final preguntasData = (data['questions'] as List<dynamic>?) ?? [];
    final preguntas =
        preguntasData
            .map((p) => PreguntaModel.fromJson(p as Map<String, dynamic>))
            .toList();

    return ExamenModel(
      id: doc.id,
      titulo: data['titulo'] as String? ?? '',
      preguntas: preguntas,
      fechaCreacion: fechaCreacion,
      fechaFinalizacion: fechaFinalizacion,
      tiempoLimiteMinutos: data['tiempoLimiteMinutos'] as int? ?? 60,
      completado: data['completado'] as bool? ?? false,
      puntajeTotal: data['puntajeTotal'] as int? ?? 0,
      puntajeObtenido: data['puntajeObtenido'] as int? ?? 0,
    );
  }

  /// Convierte el modelo a un mapa para Firestore.
  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove(
      'id',
    ); // Eliminamos el ID para que Firestore genere o use el existente

    // Convertimos las preguntas a formato JSON
    json['questions'] = preguntas.map((p) => p.toJson()).toList();

    // Aseguramos que las fechas sean Timestamp
    json['fechaCreacion'] = Timestamp.fromDate(fechaCreacion);
    if (fechaFinalizacion != null) {
      json['fechaFinalizacion'] = Timestamp.fromDate(fechaFinalizacion!);
    }

    return json;
  }

  /// Convierte el modelo a una entidad de dominio.
  ExamenEntity toEntity() => ExamenEntity(
    id: id,
    titulo: titulo,
    preguntas: preguntas.map((p) => p.toEntity()).toList(),
    fechaCreacion: fechaCreacion,
    fechaFinalizacion: fechaFinalizacion,
    tiempoLimiteMinutos: tiempoLimiteMinutos,
    completado: completado,
    puntajeTotal: puntajeTotal,
    puntajeObtenido: puntajeObtenido,
  );

  /// Crea un modelo a partir de una entidad de dominio.
  factory ExamenModel.fromEntity(ExamenEntity entity) => ExamenModel(
    id: entity.id,
    titulo: entity.titulo,
    preguntas:
        entity.preguntas.map((p) => PreguntaModel.fromEntity(p)).toList(),
    fechaCreacion: entity.fechaCreacion,
    fechaFinalizacion: entity.fechaFinalizacion,
    tiempoLimiteMinutos: entity.tiempoLimiteMinutos,
    completado: entity.completado,
    puntajeTotal: entity.puntajeTotal,
    puntajeObtenido: entity.puntajeObtenido,
  );
}
