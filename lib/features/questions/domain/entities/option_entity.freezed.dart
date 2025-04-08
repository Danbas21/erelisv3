// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OpcionEntity {

 String get texto; bool get esCorrecta;
/// Create a copy of OpcionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpcionEntityCopyWith<OpcionEntity> get copyWith => _$OpcionEntityCopyWithImpl<OpcionEntity>(this as OpcionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpcionEntity&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.esCorrecta, esCorrecta) || other.esCorrecta == esCorrecta));
}


@override
int get hashCode => Object.hash(runtimeType,texto,esCorrecta);

@override
String toString() {
  return 'OpcionEntity(texto: $texto, esCorrecta: $esCorrecta)';
}


}

/// @nodoc
abstract mixin class $OpcionEntityCopyWith<$Res>  {
  factory $OpcionEntityCopyWith(OpcionEntity value, $Res Function(OpcionEntity) _then) = _$OpcionEntityCopyWithImpl;
@useResult
$Res call({
 String texto, bool esCorrecta
});




}
/// @nodoc
class _$OpcionEntityCopyWithImpl<$Res>
    implements $OpcionEntityCopyWith<$Res> {
  _$OpcionEntityCopyWithImpl(this._self, this._then);

  final OpcionEntity _self;
  final $Res Function(OpcionEntity) _then;

/// Create a copy of OpcionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? texto = null,Object? esCorrecta = null,}) {
  return _then(_self.copyWith(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,esCorrecta: null == esCorrecta ? _self.esCorrecta : esCorrecta // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _OpcionEntity implements OpcionEntity {
  const _OpcionEntity({required this.texto, required this.esCorrecta});
  

@override final  String texto;
@override final  bool esCorrecta;

/// Create a copy of OpcionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpcionEntityCopyWith<_OpcionEntity> get copyWith => __$OpcionEntityCopyWithImpl<_OpcionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpcionEntity&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.esCorrecta, esCorrecta) || other.esCorrecta == esCorrecta));
}


@override
int get hashCode => Object.hash(runtimeType,texto,esCorrecta);

@override
String toString() {
  return 'OpcionEntity(texto: $texto, esCorrecta: $esCorrecta)';
}


}

/// @nodoc
abstract mixin class _$OpcionEntityCopyWith<$Res> implements $OpcionEntityCopyWith<$Res> {
  factory _$OpcionEntityCopyWith(_OpcionEntity value, $Res Function(_OpcionEntity) _then) = __$OpcionEntityCopyWithImpl;
@override @useResult
$Res call({
 String texto, bool esCorrecta
});




}
/// @nodoc
class __$OpcionEntityCopyWithImpl<$Res>
    implements _$OpcionEntityCopyWith<$Res> {
  __$OpcionEntityCopyWithImpl(this._self, this._then);

  final _OpcionEntity _self;
  final $Res Function(_OpcionEntity) _then;

/// Create a copy of OpcionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? texto = null,Object? esCorrecta = null,}) {
  return _then(_OpcionEntity(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,esCorrecta: null == esCorrecta ? _self.esCorrecta : esCorrecta // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
