// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progreso_examen_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgresoExamenEntity {

 String get examenId; String get usuarioId; Map<String, String> get respuestas;// Map<preguntaId, respuestaSeleccionada>
 int get preguntaActual; bool get completado; DateTime get ultimaModificacion; int? get puntajeObtenido;
/// Create a copy of ProgresoExamenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgresoExamenEntityCopyWith<ProgresoExamenEntity> get copyWith => _$ProgresoExamenEntityCopyWithImpl<ProgresoExamenEntity>(this as ProgresoExamenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgresoExamenEntity&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&const DeepCollectionEquality().equals(other.respuestas, respuestas)&&(identical(other.preguntaActual, preguntaActual) || other.preguntaActual == preguntaActual)&&(identical(other.completado, completado) || other.completado == completado)&&(identical(other.ultimaModificacion, ultimaModificacion) || other.ultimaModificacion == ultimaModificacion)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,const DeepCollectionEquality().hash(respuestas),preguntaActual,completado,ultimaModificacion,puntajeObtenido);

@override
String toString() {
  return 'ProgresoExamenEntity(examenId: $examenId, usuarioId: $usuarioId, respuestas: $respuestas, preguntaActual: $preguntaActual, completado: $completado, ultimaModificacion: $ultimaModificacion, puntajeObtenido: $puntajeObtenido)';
}


}

/// @nodoc
abstract mixin class $ProgresoExamenEntityCopyWith<$Res>  {
  factory $ProgresoExamenEntityCopyWith(ProgresoExamenEntity value, $Res Function(ProgresoExamenEntity) _then) = _$ProgresoExamenEntityCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId, Map<String, String> respuestas, int preguntaActual, bool completado, DateTime ultimaModificacion, int? puntajeObtenido
});




}
/// @nodoc
class _$ProgresoExamenEntityCopyWithImpl<$Res>
    implements $ProgresoExamenEntityCopyWith<$Res> {
  _$ProgresoExamenEntityCopyWithImpl(this._self, this._then);

  final ProgresoExamenEntity _self;
  final $Res Function(ProgresoExamenEntity) _then;

/// Create a copy of ProgresoExamenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? examenId = null,Object? usuarioId = null,Object? respuestas = null,Object? preguntaActual = null,Object? completado = null,Object? ultimaModificacion = null,Object? puntajeObtenido = freezed,}) {
  return _then(_self.copyWith(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,respuestas: null == respuestas ? _self.respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,preguntaActual: null == preguntaActual ? _self.preguntaActual : preguntaActual // ignore: cast_nullable_to_non_nullable
as int,completado: null == completado ? _self.completado : completado // ignore: cast_nullable_to_non_nullable
as bool,ultimaModificacion: null == ultimaModificacion ? _self.ultimaModificacion : ultimaModificacion // ignore: cast_nullable_to_non_nullable
as DateTime,puntajeObtenido: freezed == puntajeObtenido ? _self.puntajeObtenido : puntajeObtenido // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _ProgresoExamenEntity implements ProgresoExamenEntity {
  const _ProgresoExamenEntity({required this.examenId, required this.usuarioId, required final  Map<String, String> respuestas, required this.preguntaActual, required this.completado, required this.ultimaModificacion, this.puntajeObtenido}): _respuestas = respuestas;
  

@override final  String examenId;
@override final  String usuarioId;
 final  Map<String, String> _respuestas;
@override Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}

// Map<preguntaId, respuestaSeleccionada>
@override final  int preguntaActual;
@override final  bool completado;
@override final  DateTime ultimaModificacion;
@override final  int? puntajeObtenido;

/// Create a copy of ProgresoExamenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgresoExamenEntityCopyWith<_ProgresoExamenEntity> get copyWith => __$ProgresoExamenEntityCopyWithImpl<_ProgresoExamenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgresoExamenEntity&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas)&&(identical(other.preguntaActual, preguntaActual) || other.preguntaActual == preguntaActual)&&(identical(other.completado, completado) || other.completado == completado)&&(identical(other.ultimaModificacion, ultimaModificacion) || other.ultimaModificacion == ultimaModificacion)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,const DeepCollectionEquality().hash(_respuestas),preguntaActual,completado,ultimaModificacion,puntajeObtenido);

@override
String toString() {
  return 'ProgresoExamenEntity(examenId: $examenId, usuarioId: $usuarioId, respuestas: $respuestas, preguntaActual: $preguntaActual, completado: $completado, ultimaModificacion: $ultimaModificacion, puntajeObtenido: $puntajeObtenido)';
}


}

/// @nodoc
abstract mixin class _$ProgresoExamenEntityCopyWith<$Res> implements $ProgresoExamenEntityCopyWith<$Res> {
  factory _$ProgresoExamenEntityCopyWith(_ProgresoExamenEntity value, $Res Function(_ProgresoExamenEntity) _then) = __$ProgresoExamenEntityCopyWithImpl;
@override @useResult
$Res call({
 String examenId, String usuarioId, Map<String, String> respuestas, int preguntaActual, bool completado, DateTime ultimaModificacion, int? puntajeObtenido
});




}
/// @nodoc
class __$ProgresoExamenEntityCopyWithImpl<$Res>
    implements _$ProgresoExamenEntityCopyWith<$Res> {
  __$ProgresoExamenEntityCopyWithImpl(this._self, this._then);

  final _ProgresoExamenEntity _self;
  final $Res Function(_ProgresoExamenEntity) _then;

/// Create a copy of ProgresoExamenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,Object? respuestas = null,Object? preguntaActual = null,Object? completado = null,Object? ultimaModificacion = null,Object? puntajeObtenido = freezed,}) {
  return _then(_ProgresoExamenEntity(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,preguntaActual: null == preguntaActual ? _self.preguntaActual : preguntaActual // ignore: cast_nullable_to_non_nullable
as int,completado: null == completado ? _self.completado : completado // ignore: cast_nullable_to_non_nullable
as bool,ultimaModificacion: null == ultimaModificacion ? _self.ultimaModificacion : ultimaModificacion // ignore: cast_nullable_to_non_nullable
as DateTime,puntajeObtenido: freezed == puntajeObtenido ? _self.puntajeObtenido : puntajeObtenido // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
