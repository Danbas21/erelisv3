// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'use_progress_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitProgressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitProgressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UnitProgressState()';
}


}

/// @nodoc
class $UnitProgressStateCopyWith<$Res>  {
$UnitProgressStateCopyWith(UnitProgressState _, $Res Function(UnitProgressState) __);
}


/// @nodoc


class InitialProgress implements UnitProgressState {
  const InitialProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UnitProgressState.initial()';
}


}




/// @nodoc


class LoadingProgress implements UnitProgressState {
  const LoadingProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UnitProgressState.loading()';
}


}




/// @nodoc


class LoadedProgress implements UnitProgressState {
  const LoadedProgress({required this.progreso});
  

 final  UnidadProgreso progreso;

/// Create a copy of UnitProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedProgressCopyWith<LoadedProgress> get copyWith => _$LoadedProgressCopyWithImpl<LoadedProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedProgress&&(identical(other.progreso, progreso) || other.progreso == progreso));
}


@override
int get hashCode => Object.hash(runtimeType,progreso);

@override
String toString() {
  return 'UnitProgressState.loaded(progreso: $progreso)';
}


}

/// @nodoc
abstract mixin class $LoadedProgressCopyWith<$Res> implements $UnitProgressStateCopyWith<$Res> {
  factory $LoadedProgressCopyWith(LoadedProgress value, $Res Function(LoadedProgress) _then) = _$LoadedProgressCopyWithImpl;
@useResult
$Res call({
 UnidadProgreso progreso
});




}
/// @nodoc
class _$LoadedProgressCopyWithImpl<$Res>
    implements $LoadedProgressCopyWith<$Res> {
  _$LoadedProgressCopyWithImpl(this._self, this._then);

  final LoadedProgress _self;
  final $Res Function(LoadedProgress) _then;

/// Create a copy of UnitProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progreso = null,}) {
  return _then(LoadedProgress(
progreso: null == progreso ? _self.progreso : progreso // ignore: cast_nullable_to_non_nullable
as UnidadProgreso,
  ));
}


}

/// @nodoc


class CompletedProgress implements UnitProgressState {
  const CompletedProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletedProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UnitProgressState.completed()';
}


}




/// @nodoc


class ErrorProgress implements UnitProgressState {
  const ErrorProgress(this.message);
  

 final  String message;

/// Create a copy of UnitProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorProgressCopyWith<ErrorProgress> get copyWith => _$ErrorProgressCopyWithImpl<ErrorProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorProgress&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UnitProgressState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorProgressCopyWith<$Res> implements $UnitProgressStateCopyWith<$Res> {
  factory $ErrorProgressCopyWith(ErrorProgress value, $Res Function(ErrorProgress) _then) = _$ErrorProgressCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorProgressCopyWithImpl<$Res>
    implements $ErrorProgressCopyWith<$Res> {
  _$ErrorProgressCopyWithImpl(this._self, this._then);

  final ErrorProgress _self;
  final $Res Function(ErrorProgress) _then;

/// Create a copy of UnitProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorProgress(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$UnitProgressEvent {

 String get userId; String get unitId;
/// Create a copy of UnitProgressEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitProgressEventCopyWith<UnitProgressEvent> get copyWith => _$UnitProgressEventCopyWithImpl<UnitProgressEvent>(this as UnitProgressEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitProgressEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unitId, unitId) || other.unitId == unitId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,unitId);

@override
String toString() {
  return 'UnitProgressEvent(userId: $userId, unitId: $unitId)';
}


}

/// @nodoc
abstract mixin class $UnitProgressEventCopyWith<$Res>  {
  factory $UnitProgressEventCopyWith(UnitProgressEvent value, $Res Function(UnitProgressEvent) _then) = _$UnitProgressEventCopyWithImpl;
@useResult
$Res call({
 String userId, String unitId
});




}
/// @nodoc
class _$UnitProgressEventCopyWithImpl<$Res>
    implements $UnitProgressEventCopyWith<$Res> {
  _$UnitProgressEventCopyWithImpl(this._self, this._then);

  final UnitProgressEvent _self;
  final $Res Function(UnitProgressEvent) _then;

/// Create a copy of UnitProgressEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? unitId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _LoadProgress implements UnitProgressEvent {
  const _LoadProgress({required this.userId, required this.unitId});
  

@override final  String userId;
@override final  String unitId;

/// Create a copy of UnitProgressEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadProgressCopyWith<_LoadProgress> get copyWith => __$LoadProgressCopyWithImpl<_LoadProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadProgress&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unitId, unitId) || other.unitId == unitId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,unitId);

@override
String toString() {
  return 'UnitProgressEvent.loadProgress(userId: $userId, unitId: $unitId)';
}


}

/// @nodoc
abstract mixin class _$LoadProgressCopyWith<$Res> implements $UnitProgressEventCopyWith<$Res> {
  factory _$LoadProgressCopyWith(_LoadProgress value, $Res Function(_LoadProgress) _then) = __$LoadProgressCopyWithImpl;
@override @useResult
$Res call({
 String userId, String unitId
});




}
/// @nodoc
class __$LoadProgressCopyWithImpl<$Res>
    implements _$LoadProgressCopyWith<$Res> {
  __$LoadProgressCopyWithImpl(this._self, this._then);

  final _LoadProgress _self;
  final $Res Function(_LoadProgress) _then;

/// Create a copy of UnitProgressEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? unitId = null,}) {
  return _then(_LoadProgress(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MarkAsCompleted implements UnitProgressEvent {
  const _MarkAsCompleted({required this.userId, required this.unitId, required this.courseId, required this.title});
  

@override final  String userId;
@override final  String unitId;
 final  String courseId;
 final  String title;

/// Create a copy of UnitProgressEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsCompletedCopyWith<_MarkAsCompleted> get copyWith => __$MarkAsCompletedCopyWithImpl<_MarkAsCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsCompleted&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,userId,unitId,courseId,title);

@override
String toString() {
  return 'UnitProgressEvent.markAsCompleted(userId: $userId, unitId: $unitId, courseId: $courseId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$MarkAsCompletedCopyWith<$Res> implements $UnitProgressEventCopyWith<$Res> {
  factory _$MarkAsCompletedCopyWith(_MarkAsCompleted value, $Res Function(_MarkAsCompleted) _then) = __$MarkAsCompletedCopyWithImpl;
@override @useResult
$Res call({
 String userId, String unitId, String courseId, String title
});




}
/// @nodoc
class __$MarkAsCompletedCopyWithImpl<$Res>
    implements _$MarkAsCompletedCopyWith<$Res> {
  __$MarkAsCompletedCopyWithImpl(this._self, this._then);

  final _MarkAsCompleted _self;
  final $Res Function(_MarkAsCompleted) _then;

/// Create a copy of UnitProgressEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? unitId = null,Object? courseId = null,Object? title = null,}) {
  return _then(_MarkAsCompleted(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
