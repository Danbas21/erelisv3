// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalonState {

 SalonStatus get status; List<dynamic> get subject; String get errorMessage; String get operationMessage; bool get isSidebarExpanded;
/// Create a copy of SalonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalonStateCopyWith<SalonState> get copyWith => _$SalonStateCopyWithImpl<SalonState>(this as SalonState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalonState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.subject, subject)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationMessage, operationMessage) || other.operationMessage == operationMessage)&&(identical(other.isSidebarExpanded, isSidebarExpanded) || other.isSidebarExpanded == isSidebarExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(subject),errorMessage,operationMessage,isSidebarExpanded);

@override
String toString() {
  return 'SalonState(status: $status, subject: $subject, errorMessage: $errorMessage, operationMessage: $operationMessage, isSidebarExpanded: $isSidebarExpanded)';
}


}

/// @nodoc
abstract mixin class $SalonStateCopyWith<$Res>  {
  factory $SalonStateCopyWith(SalonState value, $Res Function(SalonState) _then) = _$SalonStateCopyWithImpl;
@useResult
$Res call({
 SalonStatus status, List<dynamic> subject, String errorMessage, String operationMessage, bool isSidebarExpanded
});




}
/// @nodoc
class _$SalonStateCopyWithImpl<$Res>
    implements $SalonStateCopyWith<$Res> {
  _$SalonStateCopyWithImpl(this._self, this._then);

  final SalonState _self;
  final $Res Function(SalonState) _then;

/// Create a copy of SalonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? subject = null,Object? errorMessage = null,Object? operationMessage = null,Object? isSidebarExpanded = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SalonStatus,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as List<dynamic>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,operationMessage: null == operationMessage ? _self.operationMessage : operationMessage // ignore: cast_nullable_to_non_nullable
as String,isSidebarExpanded: null == isSidebarExpanded ? _self.isSidebarExpanded : isSidebarExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _SalonState extends SalonState {
  const _SalonState({this.status = SalonStatus.initial, final  List<dynamic> subject = const [], this.errorMessage = '', this.operationMessage = '', this.isSidebarExpanded = true}): _subject = subject,super._();
  

@override@JsonKey() final  SalonStatus status;
 final  List<dynamic> _subject;
@override@JsonKey() List<dynamic> get subject {
  if (_subject is EqualUnmodifiableListView) return _subject;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subject);
}

@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String operationMessage;
@override@JsonKey() final  bool isSidebarExpanded;

/// Create a copy of SalonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalonStateCopyWith<_SalonState> get copyWith => __$SalonStateCopyWithImpl<_SalonState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalonState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._subject, _subject)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationMessage, operationMessage) || other.operationMessage == operationMessage)&&(identical(other.isSidebarExpanded, isSidebarExpanded) || other.isSidebarExpanded == isSidebarExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_subject),errorMessage,operationMessage,isSidebarExpanded);

@override
String toString() {
  return 'SalonState(status: $status, subject: $subject, errorMessage: $errorMessage, operationMessage: $operationMessage, isSidebarExpanded: $isSidebarExpanded)';
}


}

/// @nodoc
abstract mixin class _$SalonStateCopyWith<$Res> implements $SalonStateCopyWith<$Res> {
  factory _$SalonStateCopyWith(_SalonState value, $Res Function(_SalonState) _then) = __$SalonStateCopyWithImpl;
@override @useResult
$Res call({
 SalonStatus status, List<dynamic> subject, String errorMessage, String operationMessage, bool isSidebarExpanded
});




}
/// @nodoc
class __$SalonStateCopyWithImpl<$Res>
    implements _$SalonStateCopyWith<$Res> {
  __$SalonStateCopyWithImpl(this._self, this._then);

  final _SalonState _self;
  final $Res Function(_SalonState) _then;

/// Create a copy of SalonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? subject = null,Object? errorMessage = null,Object? operationMessage = null,Object? isSidebarExpanded = null,}) {
  return _then(_SalonState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SalonStatus,subject: null == subject ? _self._subject : subject // ignore: cast_nullable_to_non_nullable
as List<dynamic>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,operationMessage: null == operationMessage ? _self.operationMessage : operationMessage // ignore: cast_nullable_to_non_nullable
as String,isSidebarExpanded: null == isSidebarExpanded ? _self.isSidebarExpanded : isSidebarExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SalonEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalonEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalonEvent()';
}


}

/// @nodoc
class $SalonEventCopyWith<$Res>  {
$SalonEventCopyWith(SalonEvent _, $Res Function(SalonEvent) __);
}


/// @nodoc


class _LoadCourses implements SalonEvent {
  const _LoadCourses();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCourses);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalonEvent.loadCourses()';
}


}




/// @nodoc


class _LoadCourseDetails implements SalonEvent {
  const _LoadCourseDetails(this.courseId);
  

 final  String courseId;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCourseDetailsCopyWith<_LoadCourseDetails> get copyWith => __$LoadCourseDetailsCopyWithImpl<_LoadCourseDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCourseDetails&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'SalonEvent.loadCourseDetails(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$LoadCourseDetailsCopyWith<$Res> implements $SalonEventCopyWith<$Res> {
  factory _$LoadCourseDetailsCopyWith(_LoadCourseDetails value, $Res Function(_LoadCourseDetails) _then) = __$LoadCourseDetailsCopyWithImpl;
@useResult
$Res call({
 String courseId
});




}
/// @nodoc
class __$LoadCourseDetailsCopyWithImpl<$Res>
    implements _$LoadCourseDetailsCopyWith<$Res> {
  __$LoadCourseDetailsCopyWithImpl(this._self, this._then);

  final _LoadCourseDetails _self;
  final $Res Function(_LoadCourseDetails) _then;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,}) {
  return _then(_LoadCourseDetails(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddCourse implements SalonEvent {
  const _AddCourse(this.subject);
  

 final  dynamic subject;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCourseCopyWith<_AddCourse> get copyWith => __$AddCourseCopyWithImpl<_AddCourse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCourse&&const DeepCollectionEquality().equals(other.subject, subject));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subject));

@override
String toString() {
  return 'SalonEvent.addCourse(subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$AddCourseCopyWith<$Res> implements $SalonEventCopyWith<$Res> {
  factory _$AddCourseCopyWith(_AddCourse value, $Res Function(_AddCourse) _then) = __$AddCourseCopyWithImpl;
@useResult
$Res call({
 dynamic subject
});




}
/// @nodoc
class __$AddCourseCopyWithImpl<$Res>
    implements _$AddCourseCopyWith<$Res> {
  __$AddCourseCopyWithImpl(this._self, this._then);

  final _AddCourse _self;
  final $Res Function(_AddCourse) _then;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subject = freezed,}) {
  return _then(_AddCourse(
freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class _UpdateCourse implements SalonEvent {
  const _UpdateCourse(this.subject);
  

 final  dynamic subject;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCourseCopyWith<_UpdateCourse> get copyWith => __$UpdateCourseCopyWithImpl<_UpdateCourse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCourse&&const DeepCollectionEquality().equals(other.subject, subject));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subject));

@override
String toString() {
  return 'SalonEvent.updateCourse(subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$UpdateCourseCopyWith<$Res> implements $SalonEventCopyWith<$Res> {
  factory _$UpdateCourseCopyWith(_UpdateCourse value, $Res Function(_UpdateCourse) _then) = __$UpdateCourseCopyWithImpl;
@useResult
$Res call({
 dynamic subject
});




}
/// @nodoc
class __$UpdateCourseCopyWithImpl<$Res>
    implements _$UpdateCourseCopyWith<$Res> {
  __$UpdateCourseCopyWithImpl(this._self, this._then);

  final _UpdateCourse _self;
  final $Res Function(_UpdateCourse) _then;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subject = freezed,}) {
  return _then(_UpdateCourse(
freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class _DeleteCourse implements SalonEvent {
  const _DeleteCourse(this.courseId);
  

 final  String courseId;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCourseCopyWith<_DeleteCourse> get copyWith => __$DeleteCourseCopyWithImpl<_DeleteCourse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteCourse&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'SalonEvent.deleteCourse(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$DeleteCourseCopyWith<$Res> implements $SalonEventCopyWith<$Res> {
  factory _$DeleteCourseCopyWith(_DeleteCourse value, $Res Function(_DeleteCourse) _then) = __$DeleteCourseCopyWithImpl;
@useResult
$Res call({
 String courseId
});




}
/// @nodoc
class __$DeleteCourseCopyWithImpl<$Res>
    implements _$DeleteCourseCopyWith<$Res> {
  __$DeleteCourseCopyWithImpl(this._self, this._then);

  final _DeleteCourse _self;
  final $Res Function(_DeleteCourse) _then;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,}) {
  return _then(_DeleteCourse(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadCoursesSuccess implements SalonEvent {
  const _LoadCoursesSuccess(final  List<dynamic> courses): _courses = courses;
  

 final  List<dynamic> _courses;
 List<dynamic> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}


/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCoursesSuccessCopyWith<_LoadCoursesSuccess> get copyWith => __$LoadCoursesSuccessCopyWithImpl<_LoadCoursesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCoursesSuccess&&const DeepCollectionEquality().equals(other._courses, _courses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_courses));

@override
String toString() {
  return 'SalonEvent.loadCoursesSuccess(courses: $courses)';
}


}

/// @nodoc
abstract mixin class _$LoadCoursesSuccessCopyWith<$Res> implements $SalonEventCopyWith<$Res> {
  factory _$LoadCoursesSuccessCopyWith(_LoadCoursesSuccess value, $Res Function(_LoadCoursesSuccess) _then) = __$LoadCoursesSuccessCopyWithImpl;
@useResult
$Res call({
 List<dynamic> courses
});




}
/// @nodoc
class __$LoadCoursesSuccessCopyWithImpl<$Res>
    implements _$LoadCoursesSuccessCopyWith<$Res> {
  __$LoadCoursesSuccessCopyWithImpl(this._self, this._then);

  final _LoadCoursesSuccess _self;
  final $Res Function(_LoadCoursesSuccess) _then;

/// Create a copy of SalonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courses = null,}) {
  return _then(_LoadCoursesSuccess(
null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class _ToggleSidebar implements SalonEvent {
  const _ToggleSidebar();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleSidebar);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalonEvent.toggleSidebar()';
}


}




// dart format on
