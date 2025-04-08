// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregunta_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreguntaState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreguntaState()';
}


}

/// @nodoc
class $PreguntaStateCopyWith<$Res>  {
$PreguntaStateCopyWith(PreguntaState _, $Res Function(PreguntaState) __);
}


/// @nodoc


class Inicial implements PreguntaState {
  const Inicial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inicial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreguntaState.inicial()';
}


}




/// @nodoc


class Cargada implements PreguntaState {
  const Cargada({required this.pregunta, this.respuestaSeleccionada, required this.tiempoRestante});
  

 final  PreguntaEntity pregunta;
 final  String? respuestaSeleccionada;
 final  int tiempoRestante;

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CargadaCopyWith<Cargada> get copyWith => _$CargadaCopyWithImpl<Cargada>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cargada&&(identical(other.pregunta, pregunta) || other.pregunta == pregunta)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada)&&(identical(other.tiempoRestante, tiempoRestante) || other.tiempoRestante == tiempoRestante));
}


@override
int get hashCode => Object.hash(runtimeType,pregunta,respuestaSeleccionada,tiempoRestante);

@override
String toString() {
  return 'PreguntaState.cargada(pregunta: $pregunta, respuestaSeleccionada: $respuestaSeleccionada, tiempoRestante: $tiempoRestante)';
}


}

/// @nodoc
abstract mixin class $CargadaCopyWith<$Res> implements $PreguntaStateCopyWith<$Res> {
  factory $CargadaCopyWith(Cargada value, $Res Function(Cargada) _then) = _$CargadaCopyWithImpl;
@useResult
$Res call({
 PreguntaEntity pregunta, String? respuestaSeleccionada, int tiempoRestante
});


$PreguntaEntityCopyWith<$Res> get pregunta;

}
/// @nodoc
class _$CargadaCopyWithImpl<$Res>
    implements $CargadaCopyWith<$Res> {
  _$CargadaCopyWithImpl(this._self, this._then);

  final Cargada _self;
  final $Res Function(Cargada) _then;

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pregunta = null,Object? respuestaSeleccionada = freezed,Object? tiempoRestante = null,}) {
  return _then(Cargada(
pregunta: null == pregunta ? _self.pregunta : pregunta // ignore: cast_nullable_to_non_nullable
as PreguntaEntity,respuestaSeleccionada: freezed == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String?,tiempoRestante: null == tiempoRestante ? _self.tiempoRestante : tiempoRestante // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreguntaEntityCopyWith<$Res> get pregunta {
  
  return $PreguntaEntityCopyWith<$Res>(_self.pregunta, (value) {
    return _then(_self.copyWith(pregunta: value));
  });
}
}

/// @nodoc


class Respondida implements PreguntaState {
  const Respondida({required this.pregunta, required this.respuestaSeleccionada, required this.esCorrecta});
  

 final  PreguntaEntity pregunta;
 final  String respuestaSeleccionada;
 final  bool esCorrecta;

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RespondidaCopyWith<Respondida> get copyWith => _$RespondidaCopyWithImpl<Respondida>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Respondida&&(identical(other.pregunta, pregunta) || other.pregunta == pregunta)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada)&&(identical(other.esCorrecta, esCorrecta) || other.esCorrecta == esCorrecta));
}


@override
int get hashCode => Object.hash(runtimeType,pregunta,respuestaSeleccionada,esCorrecta);

@override
String toString() {
  return 'PreguntaState.respondida(pregunta: $pregunta, respuestaSeleccionada: $respuestaSeleccionada, esCorrecta: $esCorrecta)';
}


}

/// @nodoc
abstract mixin class $RespondidaCopyWith<$Res> implements $PreguntaStateCopyWith<$Res> {
  factory $RespondidaCopyWith(Respondida value, $Res Function(Respondida) _then) = _$RespondidaCopyWithImpl;
@useResult
$Res call({
 PreguntaEntity pregunta, String respuestaSeleccionada, bool esCorrecta
});


$PreguntaEntityCopyWith<$Res> get pregunta;

}
/// @nodoc
class _$RespondidaCopyWithImpl<$Res>
    implements $RespondidaCopyWith<$Res> {
  _$RespondidaCopyWithImpl(this._self, this._then);

  final Respondida _self;
  final $Res Function(Respondida) _then;

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pregunta = null,Object? respuestaSeleccionada = null,Object? esCorrecta = null,}) {
  return _then(Respondida(
pregunta: null == pregunta ? _self.pregunta : pregunta // ignore: cast_nullable_to_non_nullable
as PreguntaEntity,respuestaSeleccionada: null == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String,esCorrecta: null == esCorrecta ? _self.esCorrecta : esCorrecta // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreguntaEntityCopyWith<$Res> get pregunta {
  
  return $PreguntaEntityCopyWith<$Res>(_self.pregunta, (value) {
    return _then(_self.copyWith(pregunta: value));
  });
}
}

/// @nodoc


class TiempoAgotado implements PreguntaState {
  const TiempoAgotado({required this.pregunta, this.respuestaSeleccionada});
  

 final  PreguntaEntity pregunta;
 final  String? respuestaSeleccionada;

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TiempoAgotadoCopyWith<TiempoAgotado> get copyWith => _$TiempoAgotadoCopyWithImpl<TiempoAgotado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TiempoAgotado&&(identical(other.pregunta, pregunta) || other.pregunta == pregunta)&&(identical(other.respuestaSeleccionada, respuestaSeleccionada) || other.respuestaSeleccionada == respuestaSeleccionada));
}


@override
int get hashCode => Object.hash(runtimeType,pregunta,respuestaSeleccionada);

@override
String toString() {
  return 'PreguntaState.tiempoAgotado(pregunta: $pregunta, respuestaSeleccionada: $respuestaSeleccionada)';
}


}

/// @nodoc
abstract mixin class $TiempoAgotadoCopyWith<$Res> implements $PreguntaStateCopyWith<$Res> {
  factory $TiempoAgotadoCopyWith(TiempoAgotado value, $Res Function(TiempoAgotado) _then) = _$TiempoAgotadoCopyWithImpl;
@useResult
$Res call({
 PreguntaEntity pregunta, String? respuestaSeleccionada
});


$PreguntaEntityCopyWith<$Res> get pregunta;

}
/// @nodoc
class _$TiempoAgotadoCopyWithImpl<$Res>
    implements $TiempoAgotadoCopyWith<$Res> {
  _$TiempoAgotadoCopyWithImpl(this._self, this._then);

  final TiempoAgotado _self;
  final $Res Function(TiempoAgotado) _then;

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pregunta = null,Object? respuestaSeleccionada = freezed,}) {
  return _then(TiempoAgotado(
pregunta: null == pregunta ? _self.pregunta : pregunta // ignore: cast_nullable_to_non_nullable
as PreguntaEntity,respuestaSeleccionada: freezed == respuestaSeleccionada ? _self.respuestaSeleccionada : respuestaSeleccionada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PreguntaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreguntaEntityCopyWith<$Res> get pregunta {
  
  return $PreguntaEntityCopyWith<$Res>(_self.pregunta, (value) {
    return _then(_self.copyWith(pregunta: value));
  });
}
}

/// @nodoc
mixin _$PreguntaEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreguntaEvent()';
}


}

/// @nodoc
class $PreguntaEventCopyWith<$Res>  {
$PreguntaEventCopyWith(PreguntaEvent _, $Res Function(PreguntaEvent) __);
}


/// @nodoc


class PreguntaCargada implements PreguntaEvent {
  const PreguntaCargada({required this.pregunta, this.respuestaPrevia, this.tiempoLimite = 60});
  

 final  PreguntaEntity pregunta;
 final  String? respuestaPrevia;
@JsonKey() final  int tiempoLimite;

/// Create a copy of PreguntaEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreguntaCargadaCopyWith<PreguntaCargada> get copyWith => _$PreguntaCargadaCopyWithImpl<PreguntaCargada>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaCargada&&(identical(other.pregunta, pregunta) || other.pregunta == pregunta)&&(identical(other.respuestaPrevia, respuestaPrevia) || other.respuestaPrevia == respuestaPrevia)&&(identical(other.tiempoLimite, tiempoLimite) || other.tiempoLimite == tiempoLimite));
}


@override
int get hashCode => Object.hash(runtimeType,pregunta,respuestaPrevia,tiempoLimite);

@override
String toString() {
  return 'PreguntaEvent.cargada(pregunta: $pregunta, respuestaPrevia: $respuestaPrevia, tiempoLimite: $tiempoLimite)';
}


}

/// @nodoc
abstract mixin class $PreguntaCargadaCopyWith<$Res> implements $PreguntaEventCopyWith<$Res> {
  factory $PreguntaCargadaCopyWith(PreguntaCargada value, $Res Function(PreguntaCargada) _then) = _$PreguntaCargadaCopyWithImpl;
@useResult
$Res call({
 PreguntaEntity pregunta, String? respuestaPrevia, int tiempoLimite
});


$PreguntaEntityCopyWith<$Res> get pregunta;

}
/// @nodoc
class _$PreguntaCargadaCopyWithImpl<$Res>
    implements $PreguntaCargadaCopyWith<$Res> {
  _$PreguntaCargadaCopyWithImpl(this._self, this._then);

  final PreguntaCargada _self;
  final $Res Function(PreguntaCargada) _then;

/// Create a copy of PreguntaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pregunta = null,Object? respuestaPrevia = freezed,Object? tiempoLimite = null,}) {
  return _then(PreguntaCargada(
pregunta: null == pregunta ? _self.pregunta : pregunta // ignore: cast_nullable_to_non_nullable
as PreguntaEntity,respuestaPrevia: freezed == respuestaPrevia ? _self.respuestaPrevia : respuestaPrevia // ignore: cast_nullable_to_non_nullable
as String?,tiempoLimite: null == tiempoLimite ? _self.tiempoLimite : tiempoLimite // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PreguntaEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreguntaEntityCopyWith<$Res> get pregunta {
  
  return $PreguntaEntityCopyWith<$Res>(_self.pregunta, (value) {
    return _then(_self.copyWith(pregunta: value));
  });
}
}

/// @nodoc


class OpcionSeleccionada implements PreguntaEvent {
  const OpcionSeleccionada({required this.opcion});
  

 final  String opcion;

/// Create a copy of PreguntaEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpcionSeleccionadaCopyWith<OpcionSeleccionada> get copyWith => _$OpcionSeleccionadaCopyWithImpl<OpcionSeleccionada>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpcionSeleccionada&&(identical(other.opcion, opcion) || other.opcion == opcion));
}


@override
int get hashCode => Object.hash(runtimeType,opcion);

@override
String toString() {
  return 'PreguntaEvent.opcionSeleccionada(opcion: $opcion)';
}


}

/// @nodoc
abstract mixin class $OpcionSeleccionadaCopyWith<$Res> implements $PreguntaEventCopyWith<$Res> {
  factory $OpcionSeleccionadaCopyWith(OpcionSeleccionada value, $Res Function(OpcionSeleccionada) _then) = _$OpcionSeleccionadaCopyWithImpl;
@useResult
$Res call({
 String opcion
});




}
/// @nodoc
class _$OpcionSeleccionadaCopyWithImpl<$Res>
    implements $OpcionSeleccionadaCopyWith<$Res> {
  _$OpcionSeleccionadaCopyWithImpl(this._self, this._then);

  final OpcionSeleccionada _self;
  final $Res Function(OpcionSeleccionada) _then;

/// Create a copy of PreguntaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? opcion = null,}) {
  return _then(OpcionSeleccionada(
opcion: null == opcion ? _self.opcion : opcion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RespuestaVerificada implements PreguntaEvent {
  const RespuestaVerificada();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RespuestaVerificada);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreguntaEvent.respuestaVerificada()';
}


}




/// @nodoc


class _TiempoAgotado implements PreguntaEvent {
  const _TiempoAgotado();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TiempoAgotado);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreguntaEvent.tiempoAgotado()';
}


}




// dart format on
