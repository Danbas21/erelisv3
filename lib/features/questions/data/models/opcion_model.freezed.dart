// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opcion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpcionModel {

 String get texto; bool get esCorrecta;
/// Create a copy of OpcionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpcionModelCopyWith<OpcionModel> get copyWith => _$OpcionModelCopyWithImpl<OpcionModel>(this as OpcionModel, _$identity);

  /// Serializes this OpcionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpcionModel&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.esCorrecta, esCorrecta) || other.esCorrecta == esCorrecta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,texto,esCorrecta);

@override
String toString() {
  return 'OpcionModel(texto: $texto, esCorrecta: $esCorrecta)';
}


}

/// @nodoc
abstract mixin class $OpcionModelCopyWith<$Res>  {
  factory $OpcionModelCopyWith(OpcionModel value, $Res Function(OpcionModel) _then) = _$OpcionModelCopyWithImpl;
@useResult
$Res call({
 String texto, bool esCorrecta
});




}
/// @nodoc
class _$OpcionModelCopyWithImpl<$Res>
    implements $OpcionModelCopyWith<$Res> {
  _$OpcionModelCopyWithImpl(this._self, this._then);

  final OpcionModel _self;
  final $Res Function(OpcionModel) _then;

/// Create a copy of OpcionModel
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
@JsonSerializable()

class _OpcionModel extends OpcionModel {
  const _OpcionModel({required this.texto, required this.esCorrecta}): super._();
  factory _OpcionModel.fromJson(Map<String, dynamic> json) => _$OpcionModelFromJson(json);

@override final  String texto;
@override final  bool esCorrecta;

/// Create a copy of OpcionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpcionModelCopyWith<_OpcionModel> get copyWith => __$OpcionModelCopyWithImpl<_OpcionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpcionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpcionModel&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.esCorrecta, esCorrecta) || other.esCorrecta == esCorrecta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,texto,esCorrecta);

@override
String toString() {
  return 'OpcionModel(texto: $texto, esCorrecta: $esCorrecta)';
}


}

/// @nodoc
abstract mixin class _$OpcionModelCopyWith<$Res> implements $OpcionModelCopyWith<$Res> {
  factory _$OpcionModelCopyWith(_OpcionModel value, $Res Function(_OpcionModel) _then) = __$OpcionModelCopyWithImpl;
@override @useResult
$Res call({
 String texto, bool esCorrecta
});




}
/// @nodoc
class __$OpcionModelCopyWithImpl<$Res>
    implements _$OpcionModelCopyWith<$Res> {
  __$OpcionModelCopyWithImpl(this._self, this._then);

  final _OpcionModel _self;
  final $Res Function(_OpcionModel) _then;

/// Create a copy of OpcionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? texto = null,Object? esCorrecta = null,}) {
  return _then(_OpcionModel(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,esCorrecta: null == esCorrecta ? _self.esCorrecta : esCorrecta // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
