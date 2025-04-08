// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'examen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamenModel {

 String get id; String get titulo; List<PreguntaModel> get preguntas; DateTime get fechaCreacion; DateTime? get fechaFinalizacion; int get tiempoLimiteMinutos; bool get completado; int get puntajeTotal; int get puntajeObtenido;
/// Create a copy of ExamenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamenModelCopyWith<ExamenModel> get copyWith => _$ExamenModelCopyWithImpl<ExamenModel>(this as ExamenModel, _$identity);

  /// Serializes this ExamenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamenModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&const DeepCollectionEquality().equals(other.preguntas, preguntas)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaFinalizacion, fechaFinalizacion) || other.fechaFinalizacion == fechaFinalizacion)&&(identical(other.tiempoLimiteMinutos, tiempoLimiteMinutos) || other.tiempoLimiteMinutos == tiempoLimiteMinutos)&&(identical(other.completado, completado) || other.completado == completado)&&(identical(other.puntajeTotal, puntajeTotal) || other.puntajeTotal == puntajeTotal)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,const DeepCollectionEquality().hash(preguntas),fechaCreacion,fechaFinalizacion,tiempoLimiteMinutos,completado,puntajeTotal,puntajeObtenido);

@override
String toString() {
  return 'ExamenModel(id: $id, titulo: $titulo, preguntas: $preguntas, fechaCreacion: $fechaCreacion, fechaFinalizacion: $fechaFinalizacion, tiempoLimiteMinutos: $tiempoLimiteMinutos, completado: $completado, puntajeTotal: $puntajeTotal, puntajeObtenido: $puntajeObtenido)';
}


}

/// @nodoc
abstract mixin class $ExamenModelCopyWith<$Res>  {
  factory $ExamenModelCopyWith(ExamenModel value, $Res Function(ExamenModel) _then) = _$ExamenModelCopyWithImpl;
@useResult
$Res call({
 String id, String titulo, List<PreguntaModel> preguntas, DateTime fechaCreacion, DateTime? fechaFinalizacion, int tiempoLimiteMinutos, bool completado, int puntajeTotal, int puntajeObtenido
});




}
/// @nodoc
class _$ExamenModelCopyWithImpl<$Res>
    implements $ExamenModelCopyWith<$Res> {
  _$ExamenModelCopyWithImpl(this._self, this._then);

  final ExamenModel _self;
  final $Res Function(ExamenModel) _then;

/// Create a copy of ExamenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titulo = null,Object? preguntas = null,Object? fechaCreacion = null,Object? fechaFinalizacion = freezed,Object? tiempoLimiteMinutos = null,Object? completado = null,Object? puntajeTotal = null,Object? puntajeObtenido = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,preguntas: null == preguntas ? _self.preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaModel>,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaFinalizacion: freezed == fechaFinalizacion ? _self.fechaFinalizacion : fechaFinalizacion // ignore: cast_nullable_to_non_nullable
as DateTime?,tiempoLimiteMinutos: null == tiempoLimiteMinutos ? _self.tiempoLimiteMinutos : tiempoLimiteMinutos // ignore: cast_nullable_to_non_nullable
as int,completado: null == completado ? _self.completado : completado // ignore: cast_nullable_to_non_nullable
as bool,puntajeTotal: null == puntajeTotal ? _self.puntajeTotal : puntajeTotal // ignore: cast_nullable_to_non_nullable
as int,puntajeObtenido: null == puntajeObtenido ? _self.puntajeObtenido : puntajeObtenido // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ExamenModel extends ExamenModel {
  const _ExamenModel({required this.id, required this.titulo, required final  List<PreguntaModel> preguntas, required this.fechaCreacion, this.fechaFinalizacion, required this.tiempoLimiteMinutos, required this.completado, required this.puntajeTotal, required this.puntajeObtenido}): _preguntas = preguntas,super._();
  factory _ExamenModel.fromJson(Map<String, dynamic> json) => _$ExamenModelFromJson(json);

@override final  String id;
@override final  String titulo;
 final  List<PreguntaModel> _preguntas;
@override List<PreguntaModel> get preguntas {
  if (_preguntas is EqualUnmodifiableListView) return _preguntas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preguntas);
}

@override final  DateTime fechaCreacion;
@override final  DateTime? fechaFinalizacion;
@override final  int tiempoLimiteMinutos;
@override final  bool completado;
@override final  int puntajeTotal;
@override final  int puntajeObtenido;

/// Create a copy of ExamenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamenModelCopyWith<_ExamenModel> get copyWith => __$ExamenModelCopyWithImpl<_ExamenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamenModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&const DeepCollectionEquality().equals(other._preguntas, _preguntas)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaFinalizacion, fechaFinalizacion) || other.fechaFinalizacion == fechaFinalizacion)&&(identical(other.tiempoLimiteMinutos, tiempoLimiteMinutos) || other.tiempoLimiteMinutos == tiempoLimiteMinutos)&&(identical(other.completado, completado) || other.completado == completado)&&(identical(other.puntajeTotal, puntajeTotal) || other.puntajeTotal == puntajeTotal)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,const DeepCollectionEquality().hash(_preguntas),fechaCreacion,fechaFinalizacion,tiempoLimiteMinutos,completado,puntajeTotal,puntajeObtenido);

@override
String toString() {
  return 'ExamenModel(id: $id, titulo: $titulo, preguntas: $preguntas, fechaCreacion: $fechaCreacion, fechaFinalizacion: $fechaFinalizacion, tiempoLimiteMinutos: $tiempoLimiteMinutos, completado: $completado, puntajeTotal: $puntajeTotal, puntajeObtenido: $puntajeObtenido)';
}


}

/// @nodoc
abstract mixin class _$ExamenModelCopyWith<$Res> implements $ExamenModelCopyWith<$Res> {
  factory _$ExamenModelCopyWith(_ExamenModel value, $Res Function(_ExamenModel) _then) = __$ExamenModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titulo, List<PreguntaModel> preguntas, DateTime fechaCreacion, DateTime? fechaFinalizacion, int tiempoLimiteMinutos, bool completado, int puntajeTotal, int puntajeObtenido
});




}
/// @nodoc
class __$ExamenModelCopyWithImpl<$Res>
    implements _$ExamenModelCopyWith<$Res> {
  __$ExamenModelCopyWithImpl(this._self, this._then);

  final _ExamenModel _self;
  final $Res Function(_ExamenModel) _then;

/// Create a copy of ExamenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? preguntas = null,Object? fechaCreacion = null,Object? fechaFinalizacion = freezed,Object? tiempoLimiteMinutos = null,Object? completado = null,Object? puntajeTotal = null,Object? puntajeObtenido = null,}) {
  return _then(_ExamenModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,preguntas: null == preguntas ? _self._preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaModel>,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaFinalizacion: freezed == fechaFinalizacion ? _self.fechaFinalizacion : fechaFinalizacion // ignore: cast_nullable_to_non_nullable
as DateTime?,tiempoLimiteMinutos: null == tiempoLimiteMinutos ? _self.tiempoLimiteMinutos : tiempoLimiteMinutos // ignore: cast_nullable_to_non_nullable
as int,completado: null == completado ? _self.completado : completado // ignore: cast_nullable_to_non_nullable
as bool,puntajeTotal: null == puntajeTotal ? _self.puntajeTotal : puntajeTotal // ignore: cast_nullable_to_non_nullable
as int,puntajeObtenido: null == puntajeObtenido ? _self.puntajeObtenido : puntajeObtenido // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
