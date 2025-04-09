// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progreso_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgresoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgresoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgresoState()';
}


}

/// @nodoc
class $ProgresoStateCopyWith<$Res>  {
$ProgresoStateCopyWith(ProgresoState _, $Res Function(ProgresoState) __);
}


/// @nodoc


class Inicial implements ProgresoState {
  const Inicial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inicial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgresoState.inicial()';
}


}




/// @nodoc


class EnCursoP implements ProgresoState {
  const EnCursoP({required this.examenId, required this.usuarioId, required this.totalPreguntas, required this.preguntasRespondidas, required this.tiempoRestantes, required final  Map<String, String> respuestas, this.ultimoGuardado, this.errorGuardado}): _respuestas = respuestas;
  

 final  String examenId;
 final  String usuarioId;
 final  int totalPreguntas;
 final  int preguntasRespondidas;
 final  int tiempoRestantes;
 final  Map<String, String> _respuestas;
 Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}

 final  DateTime? ultimoGuardado;
 final  String? errorGuardado;

/// Create a copy of ProgresoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnCursoPCopyWith<EnCursoP> get copyWith => _$EnCursoPCopyWithImpl<EnCursoP>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnCursoP&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.totalPreguntas, totalPreguntas) || other.totalPreguntas == totalPreguntas)&&(identical(other.preguntasRespondidas, preguntasRespondidas) || other.preguntasRespondidas == preguntasRespondidas)&&(identical(other.tiempoRestantes, tiempoRestantes) || other.tiempoRestantes == tiempoRestantes)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas)&&(identical(other.ultimoGuardado, ultimoGuardado) || other.ultimoGuardado == ultimoGuardado)&&(identical(other.errorGuardado, errorGuardado) || other.errorGuardado == errorGuardado));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,totalPreguntas,preguntasRespondidas,tiempoRestantes,const DeepCollectionEquality().hash(_respuestas),ultimoGuardado,errorGuardado);

@override
String toString() {
  return 'ProgresoState.enCurso(examenId: $examenId, usuarioId: $usuarioId, totalPreguntas: $totalPreguntas, preguntasRespondidas: $preguntasRespondidas, tiempoRestantes: $tiempoRestantes, respuestas: $respuestas, ultimoGuardado: $ultimoGuardado, errorGuardado: $errorGuardado)';
}


}

/// @nodoc
abstract mixin class $EnCursoPCopyWith<$Res> implements $ProgresoStateCopyWith<$Res> {
  factory $EnCursoPCopyWith(EnCursoP value, $Res Function(EnCursoP) _then) = _$EnCursoPCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId, int totalPreguntas, int preguntasRespondidas, int tiempoRestantes, Map<String, String> respuestas, DateTime? ultimoGuardado, String? errorGuardado
});




}
/// @nodoc
class _$EnCursoPCopyWithImpl<$Res>
    implements $EnCursoPCopyWith<$Res> {
  _$EnCursoPCopyWithImpl(this._self, this._then);

  final EnCursoP _self;
  final $Res Function(EnCursoP) _then;

/// Create a copy of ProgresoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,Object? totalPreguntas = null,Object? preguntasRespondidas = null,Object? tiempoRestantes = null,Object? respuestas = null,Object? ultimoGuardado = freezed,Object? errorGuardado = freezed,}) {
  return _then(EnCursoP(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,totalPreguntas: null == totalPreguntas ? _self.totalPreguntas : totalPreguntas // ignore: cast_nullable_to_non_nullable
as int,preguntasRespondidas: null == preguntasRespondidas ? _self.preguntasRespondidas : preguntasRespondidas // ignore: cast_nullable_to_non_nullable
as int,tiempoRestantes: null == tiempoRestantes ? _self.tiempoRestantes : tiempoRestantes // ignore: cast_nullable_to_non_nullable
as int,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,ultimoGuardado: freezed == ultimoGuardado ? _self.ultimoGuardado : ultimoGuardado // ignore: cast_nullable_to_non_nullable
as DateTime?,errorGuardado: freezed == errorGuardado ? _self.errorGuardado : errorGuardado // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TiempoAgotado implements ProgresoState {
  const TiempoAgotado({required this.examenId, required this.usuarioId, required this.totalPreguntas, required this.preguntasRespondidas, required final  Map<String, String> respuestas}): _respuestas = respuestas;
  

 final  String examenId;
 final  String usuarioId;
 final  int totalPreguntas;
 final  int preguntasRespondidas;
 final  Map<String, String> _respuestas;
 Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}


/// Create a copy of ProgresoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TiempoAgotadoCopyWith<TiempoAgotado> get copyWith => _$TiempoAgotadoCopyWithImpl<TiempoAgotado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TiempoAgotado&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.totalPreguntas, totalPreguntas) || other.totalPreguntas == totalPreguntas)&&(identical(other.preguntasRespondidas, preguntasRespondidas) || other.preguntasRespondidas == preguntasRespondidas)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,totalPreguntas,preguntasRespondidas,const DeepCollectionEquality().hash(_respuestas));

@override
String toString() {
  return 'ProgresoState.tiempoAgotado(examenId: $examenId, usuarioId: $usuarioId, totalPreguntas: $totalPreguntas, preguntasRespondidas: $preguntasRespondidas, respuestas: $respuestas)';
}


}

/// @nodoc
abstract mixin class $TiempoAgotadoCopyWith<$Res> implements $ProgresoStateCopyWith<$Res> {
  factory $TiempoAgotadoCopyWith(TiempoAgotado value, $Res Function(TiempoAgotado) _then) = _$TiempoAgotadoCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId, int totalPreguntas, int preguntasRespondidas, Map<String, String> respuestas
});




}
/// @nodoc
class _$TiempoAgotadoCopyWithImpl<$Res>
    implements $TiempoAgotadoCopyWith<$Res> {
  _$TiempoAgotadoCopyWithImpl(this._self, this._then);

  final TiempoAgotado _self;
  final $Res Function(TiempoAgotado) _then;

/// Create a copy of ProgresoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,Object? totalPreguntas = null,Object? preguntasRespondidas = null,Object? respuestas = null,}) {
  return _then(TiempoAgotado(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,totalPreguntas: null == totalPreguntas ? _self.totalPreguntas : totalPreguntas // ignore: cast_nullable_to_non_nullable
as int,preguntasRespondidas: null == preguntasRespondidas ? _self.preguntasRespondidas : preguntasRespondidas // ignore: cast_nullable_to_non_nullable
as int,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc
mixin _$ProgresoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgresoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgresoEvent()';
}


}

/// @nodoc
class $ProgresoEventCopyWith<$Res>  {
$ProgresoEventCopyWith(ProgresoEvent _, $Res Function(ProgresoEvent) __);
}


/// @nodoc


class ProgresoIniciado implements ProgresoEvent {
  const ProgresoIniciado({required this.examenId, required this.usuarioId, required this.totalPreguntas, required final  Map<String, String> respuestas, required this.tiempoTotalSegundos}): _respuestas = respuestas;
  

 final  String examenId;
 final  String usuarioId;
 final  int totalPreguntas;
 final  Map<String, String> _respuestas;
 Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}

 final  int tiempoTotalSegundos;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgresoIniciadoCopyWith<ProgresoIniciado> get copyWith => _$ProgresoIniciadoCopyWithImpl<ProgresoIniciado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgresoIniciado&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.totalPreguntas, totalPreguntas) || other.totalPreguntas == totalPreguntas)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas)&&(identical(other.tiempoTotalSegundos, tiempoTotalSegundos) || other.tiempoTotalSegundos == tiempoTotalSegundos));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,totalPreguntas,const DeepCollectionEquality().hash(_respuestas),tiempoTotalSegundos);

@override
String toString() {
  return 'ProgresoEvent.iniciado(examenId: $examenId, usuarioId: $usuarioId, totalPreguntas: $totalPreguntas, respuestas: $respuestas, tiempoTotalSegundos: $tiempoTotalSegundos)';
}


}

/// @nodoc
abstract mixin class $ProgresoIniciadoCopyWith<$Res> implements $ProgresoEventCopyWith<$Res> {
  factory $ProgresoIniciadoCopyWith(ProgresoIniciado value, $Res Function(ProgresoIniciado) _then) = _$ProgresoIniciadoCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId, int totalPreguntas, Map<String, String> respuestas, int tiempoTotalSegundos
});




}
/// @nodoc
class _$ProgresoIniciadoCopyWithImpl<$Res>
    implements $ProgresoIniciadoCopyWith<$Res> {
  _$ProgresoIniciadoCopyWithImpl(this._self, this._then);

  final ProgresoIniciado _self;
  final $Res Function(ProgresoIniciado) _then;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,Object? totalPreguntas = null,Object? respuestas = null,Object? tiempoTotalSegundos = null,}) {
  return _then(ProgresoIniciado(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,totalPreguntas: null == totalPreguntas ? _self.totalPreguntas : totalPreguntas // ignore: cast_nullable_to_non_nullable
as int,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,tiempoTotalSegundos: null == tiempoTotalSegundos ? _self.tiempoTotalSegundos : tiempoTotalSegundos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TiempoActualizado implements ProgresoEvent {
  const TiempoActualizado({required this.segundosRestantes});
  

 final  int segundosRestantes;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TiempoActualizadoCopyWith<TiempoActualizado> get copyWith => _$TiempoActualizadoCopyWithImpl<TiempoActualizado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TiempoActualizado&&(identical(other.segundosRestantes, segundosRestantes) || other.segundosRestantes == segundosRestantes));
}


@override
int get hashCode => Object.hash(runtimeType,segundosRestantes);

@override
String toString() {
  return 'ProgresoEvent.tiempoActualizado(segundosRestantes: $segundosRestantes)';
}


}

/// @nodoc
abstract mixin class $TiempoActualizadoCopyWith<$Res> implements $ProgresoEventCopyWith<$Res> {
  factory $TiempoActualizadoCopyWith(TiempoActualizado value, $Res Function(TiempoActualizado) _then) = _$TiempoActualizadoCopyWithImpl;
@useResult
$Res call({
 int segundosRestantes
});




}
/// @nodoc
class _$TiempoActualizadoCopyWithImpl<$Res>
    implements $TiempoActualizadoCopyWith<$Res> {
  _$TiempoActualizadoCopyWithImpl(this._self, this._then);

  final TiempoActualizado _self;
  final $Res Function(TiempoActualizado) _then;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? segundosRestantes = null,}) {
  return _then(TiempoActualizado(
segundosRestantes: null == segundosRestantes ? _self.segundosRestantes : segundosRestantes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ProgresoGuardado implements ProgresoEvent {
  const ProgresoGuardado({required this.examenId, required this.usuarioId, required final  Map<String, String> respuestas, required this.preguntaActual, required this.completado}): _respuestas = respuestas;
  

 final  String examenId;
 final  String usuarioId;
 final  Map<String, String> _respuestas;
 Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}

 final  int preguntaActual;
 final  bool completado;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgresoGuardadoCopyWith<ProgresoGuardado> get copyWith => _$ProgresoGuardadoCopyWithImpl<ProgresoGuardado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgresoGuardado&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas)&&(identical(other.preguntaActual, preguntaActual) || other.preguntaActual == preguntaActual)&&(identical(other.completado, completado) || other.completado == completado));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,const DeepCollectionEquality().hash(_respuestas),preguntaActual,completado);

@override
String toString() {
  return 'ProgresoEvent.guardado(examenId: $examenId, usuarioId: $usuarioId, respuestas: $respuestas, preguntaActual: $preguntaActual, completado: $completado)';
}


}

/// @nodoc
abstract mixin class $ProgresoGuardadoCopyWith<$Res> implements $ProgresoEventCopyWith<$Res> {
  factory $ProgresoGuardadoCopyWith(ProgresoGuardado value, $Res Function(ProgresoGuardado) _then) = _$ProgresoGuardadoCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId, Map<String, String> respuestas, int preguntaActual, bool completado
});




}
/// @nodoc
class _$ProgresoGuardadoCopyWithImpl<$Res>
    implements $ProgresoGuardadoCopyWith<$Res> {
  _$ProgresoGuardadoCopyWithImpl(this._self, this._then);

  final ProgresoGuardado _self;
  final $Res Function(ProgresoGuardado) _then;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,Object? respuestas = null,Object? preguntaActual = null,Object? completado = null,}) {
  return _then(ProgresoGuardado(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,preguntaActual: null == preguntaActual ? _self.preguntaActual : preguntaActual // ignore: cast_nullable_to_non_nullable
as int,completado: null == completado ? _self.completado : completado // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PreguntaRespondida implements ProgresoEvent {
  const PreguntaRespondida({required this.preguntaId, required this.respuesta, required this.indicePreguntaActual});
  

 final  String preguntaId;
 final  String respuesta;
 final  int indicePreguntaActual;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreguntaRespondidaCopyWith<PreguntaRespondida> get copyWith => _$PreguntaRespondidaCopyWithImpl<PreguntaRespondida>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaRespondida&&(identical(other.preguntaId, preguntaId) || other.preguntaId == preguntaId)&&(identical(other.respuesta, respuesta) || other.respuesta == respuesta)&&(identical(other.indicePreguntaActual, indicePreguntaActual) || other.indicePreguntaActual == indicePreguntaActual));
}


@override
int get hashCode => Object.hash(runtimeType,preguntaId,respuesta,indicePreguntaActual);

@override
String toString() {
  return 'ProgresoEvent.preguntaRespondida(preguntaId: $preguntaId, respuesta: $respuesta, indicePreguntaActual: $indicePreguntaActual)';
}


}

/// @nodoc
abstract mixin class $PreguntaRespondidaCopyWith<$Res> implements $ProgresoEventCopyWith<$Res> {
  factory $PreguntaRespondidaCopyWith(PreguntaRespondida value, $Res Function(PreguntaRespondida) _then) = _$PreguntaRespondidaCopyWithImpl;
@useResult
$Res call({
 String preguntaId, String respuesta, int indicePreguntaActual
});




}
/// @nodoc
class _$PreguntaRespondidaCopyWithImpl<$Res>
    implements $PreguntaRespondidaCopyWith<$Res> {
  _$PreguntaRespondidaCopyWithImpl(this._self, this._then);

  final PreguntaRespondida _self;
  final $Res Function(PreguntaRespondida) _then;

/// Create a copy of ProgresoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preguntaId = null,Object? respuesta = null,Object? indicePreguntaActual = null,}) {
  return _then(PreguntaRespondida(
preguntaId: null == preguntaId ? _self.preguntaId : preguntaId // ignore: cast_nullable_to_non_nullable
as String,respuesta: null == respuesta ? _self.respuesta : respuesta // ignore: cast_nullable_to_non_nullable
as String,indicePreguntaActual: null == indicePreguntaActual ? _self.indicePreguntaActual : indicePreguntaActual // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
