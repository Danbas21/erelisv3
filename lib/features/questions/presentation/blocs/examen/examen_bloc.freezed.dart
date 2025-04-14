// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'examen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExamenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExamenState()';
}


}

/// @nodoc
class $ExamenStateCopyWith<$Res>  {
$ExamenStateCopyWith(ExamenState _, $Res Function(ExamenState) __);
}


/// @nodoc


class InicialExamen implements ExamenState {
  const InicialExamen();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InicialExamen);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExamenState.inicial()';
}


}




/// @nodoc


class Cargando implements ExamenState {
  const Cargando();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cargando);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExamenState.cargando()';
}


}




/// @nodoc


class EnCurso implements ExamenState {
  const EnCurso({required this.examen, required this.preguntaActual, required this.indicePreguntaActual, required final  Map<String, String> respuestas, required this.tiempoRestante}): _respuestas = respuestas;
  

 final  ExamenEntity examen;
 final  PreguntaEntity preguntaActual;
 final  int indicePreguntaActual;
 final  Map<String, String> _respuestas;
 Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}

 final  int tiempoRestante;

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnCursoCopyWith<EnCurso> get copyWith => _$EnCursoCopyWithImpl<EnCurso>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnCurso&&(identical(other.examen, examen) || other.examen == examen)&&(identical(other.preguntaActual, preguntaActual) || other.preguntaActual == preguntaActual)&&(identical(other.indicePreguntaActual, indicePreguntaActual) || other.indicePreguntaActual == indicePreguntaActual)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas)&&(identical(other.tiempoRestante, tiempoRestante) || other.tiempoRestante == tiempoRestante));
}


@override
int get hashCode => Object.hash(runtimeType,examen,preguntaActual,indicePreguntaActual,const DeepCollectionEquality().hash(_respuestas),tiempoRestante);

@override
String toString() {
  return 'ExamenState.enCurso(examen: $examen, preguntaActual: $preguntaActual, indicePreguntaActual: $indicePreguntaActual, respuestas: $respuestas, tiempoRestante: $tiempoRestante)';
}


}

/// @nodoc
abstract mixin class $EnCursoCopyWith<$Res> implements $ExamenStateCopyWith<$Res> {
  factory $EnCursoCopyWith(EnCurso value, $Res Function(EnCurso) _then) = _$EnCursoCopyWithImpl;
@useResult
$Res call({
 ExamenEntity examen, PreguntaEntity preguntaActual, int indicePreguntaActual, Map<String, String> respuestas, int tiempoRestante
});


$ExamenEntityCopyWith<$Res> get examen;$PreguntaEntityCopyWith<$Res> get preguntaActual;

}
/// @nodoc
class _$EnCursoCopyWithImpl<$Res>
    implements $EnCursoCopyWith<$Res> {
  _$EnCursoCopyWithImpl(this._self, this._then);

  final EnCurso _self;
  final $Res Function(EnCurso) _then;

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examen = null,Object? preguntaActual = null,Object? indicePreguntaActual = null,Object? respuestas = null,Object? tiempoRestante = null,}) {
  return _then(EnCurso(
examen: null == examen ? _self.examen : examen // ignore: cast_nullable_to_non_nullable
as ExamenEntity,preguntaActual: null == preguntaActual ? _self.preguntaActual : preguntaActual // ignore: cast_nullable_to_non_nullable
as PreguntaEntity,indicePreguntaActual: null == indicePreguntaActual ? _self.indicePreguntaActual : indicePreguntaActual // ignore: cast_nullable_to_non_nullable
as int,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,tiempoRestante: null == tiempoRestante ? _self.tiempoRestante : tiempoRestante // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamenEntityCopyWith<$Res> get examen {
  
  return $ExamenEntityCopyWith<$Res>(_self.examen, (value) {
    return _then(_self.copyWith(examen: value));
  });
}/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreguntaEntityCopyWith<$Res> get preguntaActual {
  
  return $PreguntaEntityCopyWith<$Res>(_self.preguntaActual, (value) {
    return _then(_self.copyWith(preguntaActual: value));
  });
}
}

/// @nodoc


class Finalizado implements ExamenState {
  const Finalizado({required this.examen, required this.puntajeObtenido, required final  Map<String, String> respuestas, required this.totalPreguntas, required this.preguntasRespondidas, required this.respuestasCorrectas}): _respuestas = respuestas;
  

 final  ExamenEntity examen;
 final  int puntajeObtenido;
 final  Map<String, String> _respuestas;
 Map<String, String> get respuestas {
  if (_respuestas is EqualUnmodifiableMapView) return _respuestas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respuestas);
}

 final  int totalPreguntas;
 final  int preguntasRespondidas;
 final  int respuestasCorrectas;

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinalizadoCopyWith<Finalizado> get copyWith => _$FinalizadoCopyWithImpl<Finalizado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Finalizado&&(identical(other.examen, examen) || other.examen == examen)&&(identical(other.puntajeObtenido, puntajeObtenido) || other.puntajeObtenido == puntajeObtenido)&&const DeepCollectionEquality().equals(other._respuestas, _respuestas)&&(identical(other.totalPreguntas, totalPreguntas) || other.totalPreguntas == totalPreguntas)&&(identical(other.preguntasRespondidas, preguntasRespondidas) || other.preguntasRespondidas == preguntasRespondidas)&&(identical(other.respuestasCorrectas, respuestasCorrectas) || other.respuestasCorrectas == respuestasCorrectas));
}


@override
int get hashCode => Object.hash(runtimeType,examen,puntajeObtenido,const DeepCollectionEquality().hash(_respuestas),totalPreguntas,preguntasRespondidas,respuestasCorrectas);

@override
String toString() {
  return 'ExamenState.finalizado(examen: $examen, puntajeObtenido: $puntajeObtenido, respuestas: $respuestas, totalPreguntas: $totalPreguntas, preguntasRespondidas: $preguntasRespondidas, respuestasCorrectas: $respuestasCorrectas)';
}


}

/// @nodoc
abstract mixin class $FinalizadoCopyWith<$Res> implements $ExamenStateCopyWith<$Res> {
  factory $FinalizadoCopyWith(Finalizado value, $Res Function(Finalizado) _then) = _$FinalizadoCopyWithImpl;
@useResult
$Res call({
 ExamenEntity examen, int puntajeObtenido, Map<String, String> respuestas, int totalPreguntas, int preguntasRespondidas, int respuestasCorrectas
});


$ExamenEntityCopyWith<$Res> get examen;

}
/// @nodoc
class _$FinalizadoCopyWithImpl<$Res>
    implements $FinalizadoCopyWith<$Res> {
  _$FinalizadoCopyWithImpl(this._self, this._then);

  final Finalizado _self;
  final $Res Function(Finalizado) _then;

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examen = null,Object? puntajeObtenido = null,Object? respuestas = null,Object? totalPreguntas = null,Object? preguntasRespondidas = null,Object? respuestasCorrectas = null,}) {
  return _then(Finalizado(
examen: null == examen ? _self.examen : examen // ignore: cast_nullable_to_non_nullable
as ExamenEntity,puntajeObtenido: null == puntajeObtenido ? _self.puntajeObtenido : puntajeObtenido // ignore: cast_nullable_to_non_nullable
as int,respuestas: null == respuestas ? _self._respuestas : respuestas // ignore: cast_nullable_to_non_nullable
as Map<String, String>,totalPreguntas: null == totalPreguntas ? _self.totalPreguntas : totalPreguntas // ignore: cast_nullable_to_non_nullable
as int,preguntasRespondidas: null == preguntasRespondidas ? _self.preguntasRespondidas : preguntasRespondidas // ignore: cast_nullable_to_non_nullable
as int,respuestasCorrectas: null == respuestasCorrectas ? _self.respuestasCorrectas : respuestasCorrectas // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamenEntityCopyWith<$Res> get examen {
  
  return $ExamenEntityCopyWith<$Res>(_self.examen, (value) {
    return _then(_self.copyWith(examen: value));
  });
}
}

/// @nodoc


class Error implements ExamenState {
  const Error({required this.mensaje});
  

 final  String mensaje;

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.mensaje, mensaje) || other.mensaje == mensaje));
}


@override
int get hashCode => Object.hash(runtimeType,mensaje);

@override
String toString() {
  return 'ExamenState.error(mensaje: $mensaje)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $ExamenStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String mensaje
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of ExamenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mensaje = null,}) {
  return _then(Error(
mensaje: null == mensaje ? _self.mensaje : mensaje // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExamenEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExamenEvent()';
}


}

/// @nodoc
class $ExamenEventCopyWith<$Res>  {
$ExamenEventCopyWith(ExamenEvent _, $Res Function(ExamenEvent) __);
}


/// @nodoc


class _ExamenIniciado implements ExamenEvent {
  const _ExamenIniciado({required this.examenId, required this.usuarioId});
  

 final  String examenId;
 final  String usuarioId;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamenIniciadoCopyWith<_ExamenIniciado> get copyWith => __$ExamenIniciadoCopyWithImpl<_ExamenIniciado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamenIniciado&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId);

@override
String toString() {
  return 'ExamenEvent.iniciado(examenId: $examenId, usuarioId: $usuarioId)';
}


}

/// @nodoc
abstract mixin class _$ExamenIniciadoCopyWith<$Res> implements $ExamenEventCopyWith<$Res> {
  factory _$ExamenIniciadoCopyWith(_ExamenIniciado value, $Res Function(_ExamenIniciado) _then) = __$ExamenIniciadoCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId
});




}
/// @nodoc
class __$ExamenIniciadoCopyWithImpl<$Res>
    implements _$ExamenIniciadoCopyWith<$Res> {
  __$ExamenIniciadoCopyWithImpl(this._self, this._then);

  final _ExamenIniciado _self;
  final $Res Function(_ExamenIniciado) _then;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,}) {
  return _then(_ExamenIniciado(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PreguntaCambiada implements ExamenEvent {
  const _PreguntaCambiada({required this.nuevaIndice});
  

 final  int nuevaIndice;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreguntaCambiadaCopyWith<_PreguntaCambiada> get copyWith => __$PreguntaCambiadaCopyWithImpl<_PreguntaCambiada>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreguntaCambiada&&(identical(other.nuevaIndice, nuevaIndice) || other.nuevaIndice == nuevaIndice));
}


@override
int get hashCode => Object.hash(runtimeType,nuevaIndice);

@override
String toString() {
  return 'ExamenEvent.preguntaCambiada(nuevaIndice: $nuevaIndice)';
}


}

/// @nodoc
abstract mixin class _$PreguntaCambiadaCopyWith<$Res> implements $ExamenEventCopyWith<$Res> {
  factory _$PreguntaCambiadaCopyWith(_PreguntaCambiada value, $Res Function(_PreguntaCambiada) _then) = __$PreguntaCambiadaCopyWithImpl;
@useResult
$Res call({
 int nuevaIndice
});




}
/// @nodoc
class __$PreguntaCambiadaCopyWithImpl<$Res>
    implements _$PreguntaCambiadaCopyWith<$Res> {
  __$PreguntaCambiadaCopyWithImpl(this._self, this._then);

  final _PreguntaCambiada _self;
  final $Res Function(_PreguntaCambiada) _then;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nuevaIndice = null,}) {
  return _then(_PreguntaCambiada(
nuevaIndice: null == nuevaIndice ? _self.nuevaIndice : nuevaIndice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RespuestaSeleccionada implements ExamenEvent {
  const _RespuestaSeleccionada({required this.preguntaId, required this.respuesta, required this.usuarioId});
  

 final  String preguntaId;
 final  String respuesta;
 final  String usuarioId;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespuestaSeleccionadaCopyWith<_RespuestaSeleccionada> get copyWith => __$RespuestaSeleccionadaCopyWithImpl<_RespuestaSeleccionada>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RespuestaSeleccionada&&(identical(other.preguntaId, preguntaId) || other.preguntaId == preguntaId)&&(identical(other.respuesta, respuesta) || other.respuesta == respuesta)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId));
}


@override
int get hashCode => Object.hash(runtimeType,preguntaId,respuesta,usuarioId);

@override
String toString() {
  return 'ExamenEvent.respuestaSeleccionada(preguntaId: $preguntaId, respuesta: $respuesta, usuarioId: $usuarioId)';
}


}

/// @nodoc
abstract mixin class _$RespuestaSeleccionadaCopyWith<$Res> implements $ExamenEventCopyWith<$Res> {
  factory _$RespuestaSeleccionadaCopyWith(_RespuestaSeleccionada value, $Res Function(_RespuestaSeleccionada) _then) = __$RespuestaSeleccionadaCopyWithImpl;
@useResult
$Res call({
 String preguntaId, String respuesta, String usuarioId
});




}
/// @nodoc
class __$RespuestaSeleccionadaCopyWithImpl<$Res>
    implements _$RespuestaSeleccionadaCopyWith<$Res> {
  __$RespuestaSeleccionadaCopyWithImpl(this._self, this._then);

  final _RespuestaSeleccionada _self;
  final $Res Function(_RespuestaSeleccionada) _then;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preguntaId = null,Object? respuesta = null,Object? usuarioId = null,}) {
  return _then(_RespuestaSeleccionada(
preguntaId: null == preguntaId ? _self.preguntaId : preguntaId // ignore: cast_nullable_to_non_nullable
as String,respuesta: null == respuesta ? _self.respuesta : respuesta // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ProgresoGuardadoExamen implements ExamenEvent {
  const _ProgresoGuardadoExamen({required this.examenId, required this.usuarioId});
  

 final  String examenId;
 final  String usuarioId;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgresoGuardadoExamenCopyWith<_ProgresoGuardadoExamen> get copyWith => __$ProgresoGuardadoExamenCopyWithImpl<_ProgresoGuardadoExamen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgresoGuardadoExamen&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId);

@override
String toString() {
  return 'ExamenEvent.progresoGuardado(examenId: $examenId, usuarioId: $usuarioId)';
}


}

/// @nodoc
abstract mixin class _$ProgresoGuardadoExamenCopyWith<$Res> implements $ExamenEventCopyWith<$Res> {
  factory _$ProgresoGuardadoExamenCopyWith(_ProgresoGuardadoExamen value, $Res Function(_ProgresoGuardadoExamen) _then) = __$ProgresoGuardadoExamenCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId
});




}
/// @nodoc
class __$ProgresoGuardadoExamenCopyWithImpl<$Res>
    implements _$ProgresoGuardadoExamenCopyWith<$Res> {
  __$ProgresoGuardadoExamenCopyWithImpl(this._self, this._then);

  final _ProgresoGuardadoExamen _self;
  final $Res Function(_ProgresoGuardadoExamen) _then;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,}) {
  return _then(_ProgresoGuardadoExamen(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ExamenFinalizado implements ExamenEvent {
  const _ExamenFinalizado({required this.usuarioId});
  

 final  String usuarioId;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamenFinalizadoCopyWith<_ExamenFinalizado> get copyWith => __$ExamenFinalizadoCopyWithImpl<_ExamenFinalizado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamenFinalizado&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId));
}


@override
int get hashCode => Object.hash(runtimeType,usuarioId);

@override
String toString() {
  return 'ExamenEvent.finalizado(usuarioId: $usuarioId)';
}


}

/// @nodoc
abstract mixin class _$ExamenFinalizadoCopyWith<$Res> implements $ExamenEventCopyWith<$Res> {
  factory _$ExamenFinalizadoCopyWith(_ExamenFinalizado value, $Res Function(_ExamenFinalizado) _then) = __$ExamenFinalizadoCopyWithImpl;
@useResult
$Res call({
 String usuarioId
});




}
/// @nodoc
class __$ExamenFinalizadoCopyWithImpl<$Res>
    implements _$ExamenFinalizadoCopyWith<$Res> {
  __$ExamenFinalizadoCopyWithImpl(this._self, this._then);

  final _ExamenFinalizado _self;
  final $Res Function(_ExamenFinalizado) _then;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? usuarioId = null,}) {
  return _then(_ExamenFinalizado(
usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ProgresoRecuperado implements ExamenEvent {
  const _ProgresoRecuperado({required this.examenId, required this.usuarioId, required this.progreso});
  

 final  String examenId;
 final  String usuarioId;
 final  ProgresoExamenEntity progreso;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgresoRecuperadoCopyWith<_ProgresoRecuperado> get copyWith => __$ProgresoRecuperadoCopyWithImpl<_ProgresoRecuperado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgresoRecuperado&&(identical(other.examenId, examenId) || other.examenId == examenId)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.progreso, progreso) || other.progreso == progreso));
}


@override
int get hashCode => Object.hash(runtimeType,examenId,usuarioId,progreso);

@override
String toString() {
  return 'ExamenEvent.progresoRecuperado(examenId: $examenId, usuarioId: $usuarioId, progreso: $progreso)';
}


}

/// @nodoc
abstract mixin class _$ProgresoRecuperadoCopyWith<$Res> implements $ExamenEventCopyWith<$Res> {
  factory _$ProgresoRecuperadoCopyWith(_ProgresoRecuperado value, $Res Function(_ProgresoRecuperado) _then) = __$ProgresoRecuperadoCopyWithImpl;
@useResult
$Res call({
 String examenId, String usuarioId, ProgresoExamenEntity progreso
});


$ProgresoExamenEntityCopyWith<$Res> get progreso;

}
/// @nodoc
class __$ProgresoRecuperadoCopyWithImpl<$Res>
    implements _$ProgresoRecuperadoCopyWith<$Res> {
  __$ProgresoRecuperadoCopyWithImpl(this._self, this._then);

  final _ProgresoRecuperado _self;
  final $Res Function(_ProgresoRecuperado) _then;

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examenId = null,Object? usuarioId = null,Object? progreso = null,}) {
  return _then(_ProgresoRecuperado(
examenId: null == examenId ? _self.examenId : examenId // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,progreso: null == progreso ? _self.progreso : progreso // ignore: cast_nullable_to_non_nullable
as ProgresoExamenEntity,
  ));
}

/// Create a copy of ExamenEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgresoExamenEntityCopyWith<$Res> get progreso {
  
  return $ProgresoExamenEntityCopyWith<$Res>(_self.progreso, (value) {
    return _then(_self.copyWith(progreso: value));
  });
}
}

// dart format on
