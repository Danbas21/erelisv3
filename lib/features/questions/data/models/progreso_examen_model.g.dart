// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progreso_examen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgresoExamenModel _$ProgresoExamenModelFromJson(Map<String, dynamic> json) =>
    _ProgresoExamenModel(
      examenId: json['examenId'] as String,
      usuarioId: json['usuarioId'] as String,
      respuestas: Map<String, String>.from(json['respuestas'] as Map),
      preguntaActual: (json['preguntaActual'] as num).toInt(),
      completado: json['completado'] as bool,
      ultimaModificacion: DateTime.parse(json['ultimaModificacion'] as String),
      puntajeObtenido: (json['puntajeObtenido'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProgresoExamenModelToJson(
  _ProgresoExamenModel instance,
) => <String, dynamic>{
  'examenId': instance.examenId,
  'usuarioId': instance.usuarioId,
  'respuestas': instance.respuestas,
  'preguntaActual': instance.preguntaActual,
  'completado': instance.completado,
  'ultimaModificacion': instance.ultimaModificacion.toIso8601String(),
  'puntajeObtenido': instance.puntajeObtenido,
};
