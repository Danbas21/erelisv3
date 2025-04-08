// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opcion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpcionModel _$OpcionModelFromJson(Map<String, dynamic> json) => _OpcionModel(
  texto: json['texto'] as String,
  esCorrecta: json['esCorrecta'] as bool,
);

Map<String, dynamic> _$OpcionModelToJson(_OpcionModel instance) =>
    <String, dynamic>{
      'texto': instance.texto,
      'esCorrecta': instance.esCorrecta,
    };
