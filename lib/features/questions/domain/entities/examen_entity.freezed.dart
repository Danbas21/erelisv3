// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'examen_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExamenEntity {

 String get id; String get titulo; List<PreguntaEntity> get preguntas; DateTime get fechaCreacion; DateTime? get fechaFinalizacion; int get tiempoLimiteMinutos; bool get completado; int get puntajeTotal; int get puntajeObtenido;
/// Create a copy of ExamenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamenEntityCopyWith<ExamenEntity> get copyWith => _$ExamenEntityCopyWithImpl<ExamenEntity>(this as ExamenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&const DeepCollectionEquality().equals(other.preguntas, preguntas)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaFinalizacion, fechaFinalizacion) || other.fechaFinalizacion == fechaFinalizacion)&&(identical(other.tiempoLimiteMinutos, tiempoLimiteMinutos) || other.tiempoLimiteMinutos == tiempoLimiteMinutos)&&(identical(other.completado, completado) || other.completado == completado)&&(identical(other.puntajeTotal, puntajeTotal) || other.puntajeTotal == puntajeTotal)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido));
}


@override
int get hashCode => Object.hash(runtimeType,id,titulo,const DeepCollectionEquality().hash(preguntas),fechaCreacion,fechaFinalizacion,tiempoLimiteMinutos,completado,puntajeTotal,puntajeObtenido);

@override
String toString() {
  return 'ExamenEntity(id: $id, titulo: $titulo, preguntas: $preguntas, fechaCreacion: $fechaCreacion, fechaFinalizacion: $fechaFinalizacion, tiempoLimiteMinutos: $tiempoLimiteMinutos, completado: $completado, puntajeTotal: $puntajeTotal, puntajeObtenido: $puntajeObtenido)';
}


}

/// @nodoc
abstract mixin class $ExamenEntityCopyWith<$Res>  {
  factory $ExamenEntityCopyWith(ExamenEntity value, $Res Function(ExamenEntity) _then) = _$ExamenEntityCopyWithImpl;
@useResult
$Res call({
 String id, String titulo, List<PreguntaEntity> preguntas, DateTime fechaCreacion, DateTime? fechaFinalizacion, int tiempoLimiteMinutos, bool completado, int puntajeTotal, int puntajeObtenido
});




}
/// @nodoc
class _$ExamenEntityCopyWithImpl<$Res>
    implements $ExamenEntityCopyWith<$Res> {
  _$ExamenEntityCopyWithImpl(this._self, this._then);

  final ExamenEntity _self;
  final $Res Function(ExamenEntity) _then;

/// Create a copy of ExamenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titulo = null,Object? preguntas = null,Object? fechaCreacion = null,Object? fechaFinalizacion = freezed,Object? tiempoLimiteMinutos = null,Object? completado = null,Object? puntajeTotal = null,Object? puntajeObtenido = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,preguntas: null == preguntas ? _self.preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaEntity>,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
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


class _ExamenEntity implements ExamenEntity {
  const _ExamenEntity({required this.id, required this.titulo, required final  List<PreguntaEntity> preguntas, required this.fechaCreacion, this.fechaFinalizacion, required this.tiempoLimiteMinutos, required this.completado, required this.puntajeTotal, required this.puntajeObtenido}): _preguntas = preguntas;
  

@override final  String id;
@override final  String titulo;
 final  List<PreguntaEntity> _preguntas;
@override List<PreguntaEntity> get preguntas {
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

/// Create a copy of ExamenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamenEntityCopyWith<_ExamenEntity> get copyWith => __$ExamenEntityCopyWithImpl<_ExamenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamenEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&const DeepCollectionEquality().equals(other._preguntas, _preguntas)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaFinalizacion, fechaFinalizacion) || other.fechaFinalizacion == fechaFinalizacion)&&(identical(other.tiempoLimiteMinutos, tiempoLimiteMinutos) || other.tiempoLimiteMinutos == tiempoLimiteMinutos)&&(identical(other.completado, completado) || other.completado == completado)&&(identical(other.puntajeTotal, puntajeTotal) || other.puntajeTotal == puntajeTotal)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido));
}


@override
int get hashCode => Object.hash(runtimeType,id,titulo,const DeepCollectionEquality().hash(_preguntas),fechaCreacion,fechaFinalizacion,tiempoLimiteMinutos,completado,puntajeTotal,puntajeObtenido);

@override
String toString() {
  return 'ExamenEntity(id: $id, titulo: $titulo, preguntas: $preguntas, fechaCreacion: $fechaCreacion, fechaFinalizacion: $fechaFinalizacion, tiempoLimiteMinutos: $tiempoLimiteMinutos, completado: $completado, puntajeTotal: $puntajeTotal, puntajeObtenido: $puntajeObtenido)';
}


}

/// @nodoc
abstract mixin class _$ExamenEntityCopyWith<$Res> implements $ExamenEntityCopyWith<$Res> {
  factory _$ExamenEntityCopyWith(_ExamenEntity value, $Res Function(_ExamenEntity) _then) = __$ExamenEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String titulo, List<PreguntaEntity> preguntas, DateTime fechaCreacion, DateTime? fechaFinalizacion, int tiempoLimiteMinutos, bool completado, int puntajeTotal, int puntajeObtenido
});




}
/// @nodoc
class __$ExamenEntityCopyWithImpl<$Res>
    implements _$ExamenEntityCopyWith<$Res> {
  __$ExamenEntityCopyWithImpl(this._self, this._then);

  final _ExamenEntity _self;
  final $Res Function(_ExamenEntity) _then;

/// Create a copy of ExamenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? preguntas = null,Object? fechaCreacion = null,Object? fechaFinalizacion = freezed,Object? tiempoLimiteMinutos = null,Object? completado = null,Object? puntajeTotal = null,Object? puntajeObtenido = null,}) {
  return _then(_ExamenEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,preguntas: null == preguntas ? _self._preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaEntity>,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
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
