// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregunta_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreguntaEntity {

 String get id; String get texto; String get tipo; int get puntos; List<OpcionEntity> get opciones; String get explicacion; int get orden; String? get respuestaSeleccionada;
/// Create a copy of PreguntaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreguntaEntityCopyWith<PreguntaEntity> get copyWith => _$PreguntaEntityCopyWithImpl<PreguntaEntity>(this as PreguntaEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.puntos, puntos) || other.puntos == puntos)&&const DeepCollectionEquality().equals(other.opciones, opciones)&&(identical(other.explicacion, explicacion) || other.explicacion == explicacion)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada));
}


@override
int get hashCode => Object.hash(runtimeType,id,texto,tipo,puntos,const DeepCollectionEquality().hash(opciones),explicacion,orden,respuestaSeleccionada);

@override
String toString() {
  return 'PreguntaEntity(id: $id, texto: $texto, tipo: $tipo, puntos: $puntos, opciones: $opciones, explicacion: $explicacion, orden: $orden, respuestaSeleccionada: $respuestaSeleccionada)';
}


}

/// @nodoc
abstract mixin class $PreguntaEntityCopyWith<$Res>  {
  factory $PreguntaEntityCopyWith(PreguntaEntity value, $Res Function(PreguntaEntity) _then) = _$PreguntaEntityCopyWithImpl;
@useResult
$Res call({
 String id, String texto, String tipo, int puntos, List<OpcionEntity> opciones, String explicacion, int orden, String? respuestaSeleccionada
});




}
/// @nodoc
class _$PreguntaEntityCopyWithImpl<$Res>
    implements $PreguntaEntityCopyWith<$Res> {
  _$PreguntaEntityCopyWithImpl(this._self, this._then);

  final PreguntaEntity _self;
  final $Res Function(PreguntaEntity) _then;

/// Create a copy of PreguntaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? texto = null,Object? tipo = null,Object? puntos = null,Object? opciones = null,Object? explicacion = null,Object? orden = null,Object? respuestaSeleccionada = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String,puntos: null == puntos ? _self.puntos : puntos // ignore: cast_nullable_to_non_nullable
as int,opciones: null == opciones ? _self.opciones : opciones // ignore: cast_nullable_to_non_nullable
as List<OpcionEntity>,explicacion: null == explicacion ? _self.explicacion : explicacion // ignore: cast_nullable_to_non_nullable
as String,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,respuestaSeleccionada: freezed == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _PreguntaEntity implements PreguntaEntity {
  const _PreguntaEntity({required this.id, required this.texto, required this.tipo, required this.puntos, required final  List<OpcionEntity> opciones, required this.explicacion, required this.orden, this.respuestaSeleccionada}): _opciones = opciones;
  

@override final  String id;
@override final  String texto;
@override final  String tipo;
@override final  int puntos;
 final  List<OpcionEntity> _opciones;
@override List<OpcionEntity> get opciones {
  if (_opciones is EqualUnmodifiableListView) return _opciones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_opciones);
}

@override final  String explicacion;
@override final  int orden;
@override final  String? respuestaSeleccionada;

/// Create a copy of PreguntaEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreguntaEntityCopyWith<_PreguntaEntity> get copyWith => __$PreguntaEntityCopyWithImpl<_PreguntaEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreguntaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.puntos, puntos) || other.puntos == puntos)&&const DeepCollectionEquality().equals(other._opciones, _opciones)&&(identical(other.explicacion, explicacion) || other.explicacion == explicacion)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada));
}


@override
int get hashCode => Object.hash(runtimeType,id,texto,tipo,puntos,const DeepCollectionEquality().hash(_opciones),explicacion,orden,respuestaSeleccionada);

@override
String toString() {
  return 'PreguntaEntity(id: $id, texto: $texto, tipo: $tipo, puntos: $puntos, opciones: $opciones, explicacion: $explicacion, orden: $orden, respuestaSeleccionada: $respuestaSeleccionada)';
}


}

/// @nodoc
abstract mixin class _$PreguntaEntityCopyWith<$Res> implements $PreguntaEntityCopyWith<$Res> {
  factory _$PreguntaEntityCopyWith(_PreguntaEntity value, $Res Function(_PreguntaEntity) _then) = __$PreguntaEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String texto, String tipo, int puntos, List<OpcionEntity> opciones, String explicacion, int orden, String? respuestaSeleccionada
});




}
/// @nodoc
class __$PreguntaEntityCopyWithImpl<$Res>
    implements _$PreguntaEntityCopyWith<$Res> {
  __$PreguntaEntityCopyWithImpl(this._self, this._then);

  final _PreguntaEntity _self;
  final $Res Function(_PreguntaEntity) _then;

/// Create a copy of PreguntaEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? texto = null,Object? tipo = null,Object? puntos = null,Object? opciones = null,Object? explicacion = null,Object? orden = null,Object? respuestaSeleccionada = freezed,}) {
  return _then(_PreguntaEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String,puntos: null == puntos ? _self.puntos : puntos // ignore: cast_nullable_to_non_nullable
as int,opciones: null == opciones ? _self._opciones : opciones // ignore: cast_nullable_to_non_nullable
as List<OpcionEntity>,explicacion: null == explicacion ? _self.explicacion : explicacion // ignore: cast_nullable_to_non_nullable
as String,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,respuestaSeleccionada: freezed == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
