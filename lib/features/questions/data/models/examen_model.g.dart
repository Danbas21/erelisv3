// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamenModel _$ExamenModelFromJson(Map<String, dynamic> json) => _ExamenModel(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  preguntas:
      (json['preguntas'] as List<dynamic>)
          .map((e) => PreguntaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
  fechaFinalizacion:
      json['fechaFinalizacion'] == null
          ? null
          : DateTime.parse(json['fechaFinalizacion'] as String),
  tiempoLimiteMinutos: (json['tiempoLimiteMinutos'] as num).toInt(),
  completado: json['completado'] as bool,
  puntajeTotal: (json['puntajeTotal'] as num).toInt(),
  puntajeObtenido: (json['puntajeObtenido'] as num).toInt(),
);

Map<String, dynamic> _$ExamenModelToJson(_ExamenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'preguntas': instance.preguntas,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
      'fechaFinalizacion': instance.fechaFinalizacion?.toIso8601String(),
      'tiempoLimiteMinutos': instance.tiempoLimiteMinutos,
      'completado': instance.completado,
      'puntajeTotal': instance.puntajeTotal,
      'puntajeObtenido': instance.puntajeObtenido,
    };
