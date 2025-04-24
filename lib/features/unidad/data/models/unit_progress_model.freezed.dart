// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitProgressModel {

 String get unitId; String get courseId; String get userId; DateTime get fechaCompletado; bool get isComplete; String get title;
/// Create a copy of UnitProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitProgressModelCopyWith<UnitProgressModel> get copyWith => _$UnitProgressModelCopyWithImpl<UnitProgressModel>(this as UnitProgressModel, _$identity);

  /// Serializes this UnitProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitProgressModel&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fechaCompletado, fechaCompletado) || other.fechaCompletado == fechaCompletado)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,courseId,userId,fechaCompletado,isComplete,title);

@override
String toString() {
  return 'UnitProgressModel(unitId: $unitId, courseId: $courseId, userId: $userId, fechaCompletado: $fechaCompletado, isComplete: $isComplete, title: $title)';
}


}

/// @nodoc
abstract mixin class $UnitProgressModelCopyWith<$Res>  {
  factory $UnitProgressModelCopyWith(UnitProgressModel value, $Res Function(UnitProgressModel) _then) = _$UnitProgressModelCopyWithImpl;
@useResult
$Res call({
 String unitId, String courseId, String userId, DateTime fechaCompletado, bool isComplete, String title
});




}
/// @nodoc
class _$UnitProgressModelCopyWithImpl<$Res>
    implements $UnitProgressModelCopyWith<$Res> {
  _$UnitProgressModelCopyWithImpl(this._self, this._then);

  final UnitProgressModel _self;
  final $Res Function(UnitProgressModel) _then;

/// Create a copy of UnitProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitId = null,Object? courseId = null,Object? userId = null,Object? fechaCompletado = null,Object? isComplete = null,Object? title = null,}) {
  return _then(_self.copyWith(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fechaCompletado: null == fechaCompletado ? _self.fechaCompletado : fechaCompletado // ignore: cast_nullable_to_non_nullable
as DateTime,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UnitProgressModel extends UnitProgressModel {
  const _UnitProgressModel({required this.unitId, required this.courseId, required this.userId, required this.fechaCompletado, required this.isComplete, required this.title}): super._();
  factory _UnitProgressModel.fromJson(Map<String, dynamic> json) => _$UnitProgressModelFromJson(json);

@override final  String unitId;
@override final  String courseId;
@override final  String userId;
@override final  DateTime fechaCompletado;
@override final  bool isComplete;
@override final  String title;

/// Create a copy of UnitProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitProgressModelCopyWith<_UnitProgressModel> get copyWith => __$UnitProgressModelCopyWithImpl<_UnitProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitProgressModel&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fechaCompletado, fechaCompletado) || other.fechaCompletado == fechaCompletado)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,courseId,userId,fechaCompletado,isComplete,title);

@override
String toString() {
  return 'UnitProgressModel(unitId: $unitId, courseId: $courseId, userId: $userId, fechaCompletado: $fechaCompletado, isComplete: $isComplete, title: $title)';
}


}

/// @nodoc
abstract mixin class _$UnitProgressModelCopyWith<$Res> implements $UnitProgressModelCopyWith<$Res> {
  factory _$UnitProgressModelCopyWith(_UnitProgressModel value, $Res Function(_UnitProgressModel) _then) = __$UnitProgressModelCopyWithImpl;
@override @useResult
$Res call({
 String unitId, String courseId, String userId, DateTime fechaCompletado, bool isComplete, String title
});




}
/// @nodoc
class __$UnitProgressModelCopyWithImpl<$Res>
    implements _$UnitProgressModelCopyWith<$Res> {
  __$UnitProgressModelCopyWithImpl(this._self, this._then);

  final _UnitProgressModel _self;
  final $Res Function(_UnitProgressModel) _then;

/// Create a copy of UnitProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitId = null,Object? courseId = null,Object? userId = null,Object? fechaCompletado = null,Object? isComplete = null,Object? title = null,}) {
  return _then(_UnitProgressModel(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fechaCompletado: null == fechaCompletado ? _self.fechaCompletado : fechaCompletado // ignore: cast_nullable_to_non_nullable
as DateTime,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
