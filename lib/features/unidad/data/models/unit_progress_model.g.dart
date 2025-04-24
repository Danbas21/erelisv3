// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitProgressModel _$UnitProgressModelFromJson(Map<String, dynamic> json) =>
    _UnitProgressModel(
      unitId: json['unitId'] as String,
      courseId: json['courseId'] as String,
      userId: json['userId'] as String,
      fechaCompletado: DateTime.parse(json['fechaCompletado'] as String),
      isComplete: json['isComplete'] as bool,
      title: json['title'] as String,
    );

Map<String, dynamic> _$UnitProgressModelToJson(_UnitProgressModel instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'courseId': instance.courseId,
      'userId': instance.userId,
      'fechaCompletado': instance.fechaCompletado.toIso8601String(),
      'isComplete': instance.isComplete,
      'title': instance.title,
    };
