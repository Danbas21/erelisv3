// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregunta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreguntaModel {

 String get id; String get texto; String get tipo; int get puntos; List<OpcionModel> get opciones; String get explicacion; int get orden; String? get respuestaSeleccionada;
/// Create a copy of PreguntaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreguntaModelCopyWith<PreguntaModel> get copyWith => _$PreguntaModelCopyWithImpl<PreguntaModel>(this as PreguntaModel, _$identity);

  /// Serializes this PreguntaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.puntos, puntos) || other.puntos == puntos)&&const DeepCollectionEquality().equals(other.opciones, opciones)&&(identical(other.explicacion, explicacion) || other.explicacion == explicacion)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,texto,tipo,puntos,const DeepCollectionEquality().hash(opciones),explicacion,orden,respuestaSeleccionada);

@override
String toString() {
  return 'PreguntaModel(id: $id, texto: $texto, tipo: $tipo, puntos: $puntos, opciones: $opciones, explicacion: $explicacion, orden: $orden, respuestaSeleccionada: $respuestaSeleccionada)';
}


}

/// @nodoc
abstract mixin class $PreguntaModelCopyWith<$Res>  {
  factory $PreguntaModelCopyWith(PreguntaModel value, $Res Function(PreguntaModel) _then) = _$PreguntaModelCopyWithImpl;
@useResult
$Res call({
 String id, String texto, String tipo, int puntos, List<OpcionModel> opciones, String explicacion, int orden, String? respuestaSeleccionada
});




}
/// @nodoc
class _$PreguntaModelCopyWithImpl<$Res>
    implements $PreguntaModelCopyWith<$Res> {
  _$PreguntaModelCopyWithImpl(this._self, this._then);

  final PreguntaModel _self;
  final $Res Function(PreguntaModel) _then;

/// Create a copy of PreguntaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? texto = null,Object? tipo = null,Object? puntos = null,Object? opciones = null,Object? explicacion = null,Object? orden = null,Object? respuestaSeleccionada = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String,puntos: null == puntos ? _self.puntos : puntos // ignore: cast_nullable_to_non_nullable
as int,opciones: null == opciones ? _self.opciones : opciones // ignore: cast_nullable_to_non_nullable
as List<OpcionModel>,explicacion: null == explicacion ? _self.explicacion : explicacion // ignore: cast_nullable_to_non_nullable
as String,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,respuestaSeleccionada: freezed == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PreguntaModel extends PreguntaModel {
  const _PreguntaModel({required this.id, required this.texto, required this.tipo, required this.puntos, required final  List<OpcionModel> opciones, required this.explicacion, required this.orden, this.respuestaSeleccionada}): _opciones = opciones,super._();
  factory _PreguntaModel.fromJson(Map<String, dynamic> json) => _$PreguntaModelFromJson(json);

@override final  String id;
@override final  String texto;
@override final  String tipo;
@override final  int puntos;
 final  List<OpcionModel> _opciones;
@override List<OpcionModel> get opciones {
  if (_opciones is EqualUnmodifiableListView) return _opciones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_opciones);
}

@override final  String explicacion;
@override final  int orden;
@override final  String? respuestaSeleccionada;

/// Create a copy of PreguntaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreguntaModelCopyWith<_PreguntaModel> get copyWith => __$PreguntaModelCopyWithImpl<_PreguntaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreguntaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreguntaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.puntos, puntos) || other.puntos == puntos)&&const DeepCollectionEquality().equals(other._opciones, _opciones)&&(identical(other.explicacion, explicacion) || other.explicacion == explicacion)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,texto,tipo,puntos,const DeepCollectionEquality().hash(_opciones),explicacion,orden,respuestaSeleccionada);

@override
String toString() {
  return 'PreguntaModel(id: $id, texto: $texto, tipo: $tipo, puntos: $puntos, opciones: $opciones, explicacion: $explicacion, orden: $orden, respuestaSeleccionada: $respuestaSeleccionada)';
}


}

/// @nodoc
abstract mixin class _$PreguntaModelCopyWith<$Res> implements $PreguntaModelCopyWith<$Res> {
  factory _$PreguntaModelCopyWith(_PreguntaModel value, $Res Function(_PreguntaModel) _then) = __$PreguntaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String texto, String tipo, int puntos, List<OpcionModel> opciones, String explicacion, int orden, String? respuestaSeleccionada
});




}
/// @nodoc
class __$PreguntaModelCopyWithImpl<$Res>
    implements _$PreguntaModelCopyWith<$Res> {
  __$PreguntaModelCopyWithImpl(this._self, this._then);

  final _PreguntaModel _self;
  final $Res Function(_PreguntaModel) _then;

/// Create a copy of PreguntaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? texto = null,Object? tipo = null,Object? puntos = null,Object? opciones = null,Object? explicacion = null,Object? orden = null,Object? respuestaSeleccionada = freezed,}) {
  return _then(_PreguntaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String,puntos: null == puntos ? _self.puntos : puntos // ignore: cast_nullable_to_non_nullable
as int,opciones: null == opciones ? _self._opciones : opciones // ignore: cast_nullable_to_non_nullable
as List<OpcionModel>,explicacion: null == explicacion ? _self.explicacion : explicacion // ignore: cast_nullable_to_non_nullable
as String,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,respuestaSeleccionada: freezed == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
