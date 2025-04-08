// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregunta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreguntaModel _$PreguntaModelFromJson(Map<String, dynamic> json) =>
    _PreguntaModel(
      id: json['id'] as String,
      texto: json['texto'] as String,
      tipo: json['tipo'] as String,
      puntos: (json['puntos'] as num).toInt(),
      opciones:
          (json['opciones'] as List<dynamic>)
              .map((e) => OpcionModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      explicacion: json['explicacion'] as String,
      orden: (json['orden'] as num).toInt(),
      respuestaSeleccionada: json['respuestaSeleccionada'] as String?,
    );

Map<String, dynamic> _$PreguntaModelToJson(_PreguntaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'texto': instance.texto,
      'tipo': instance.tipo,
      'puntos': instance.puntos,
      'opciones': instance.opciones,
      'explicacion': instance.explicacion,
      'orden': instance.orden,
      'respuestaSeleccionada': instance.respuestaSeleccionada,
    };
