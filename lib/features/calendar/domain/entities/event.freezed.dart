// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventCalendar {

 String get id; String get title; String get description; DateTime get startDate; bool get isDeadLine;@ColorConverter() Color get color; String get status;
/// Create a copy of EventCalendar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCalendarCopyWith<EventCalendar> get copyWith => _$EventCalendarCopyWithImpl<EventCalendar>(this as EventCalendar, _$identity);

  /// Serializes this EventCalendar to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventCalendar&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.isDeadLine, isDeadLine) || other.isDeadLine == isDeadLine)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startDate,isDeadLine,color,status);

@override
String toString() {
  return 'EventCalendar(id: $id, title: $title, description: $description, startDate: $startDate, isDeadLine: $isDeadLine, color: $color, status: $status)';
}


}

/// @nodoc
abstract mixin class $EventCalendarCopyWith<$Res>  {
  factory $EventCalendarCopyWith(EventCalendar value, $Res Function(EventCalendar) _then) = _$EventCalendarCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startDate, bool isDeadLine,@ColorConverter() Color color, String status
});




}
/// @nodoc
class _$EventCalendarCopyWithImpl<$Res>
    implements $EventCalendarCopyWith<$Res> {
  _$EventCalendarCopyWithImpl(this._self, this._then);

  final EventCalendar _self;
  final $Res Function(EventCalendar) _then;

/// Create a copy of EventCalendar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startDate = null,Object? isDeadLine = null,Object? color = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,isDeadLine: null == isDeadLine ? _self.isDeadLine : isDeadLine // ignore: cast_nullable_to_non_nullable
as bool,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EventCalendar implements EventCalendar {
  const _EventCalendar({required this.id, required this.title, required this.description, required this.startDate, required this.isDeadLine, @ColorConverter() required this.color, required this.status});
  factory _EventCalendar.fromJson(Map<String, dynamic> json) => _$EventCalendarFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime startDate;
@override final  bool isDeadLine;
@override@ColorConverter() final  Color color;
@override final  String status;

/// Create a copy of EventCalendar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCalendarCopyWith<_EventCalendar> get copyWith => __$EventCalendarCopyWithImpl<_EventCalendar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventCalendarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCalendar&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.isDeadLine, isDeadLine) || other.isDeadLine == isDeadLine)&&(identical(other.color, color) || other.color == color)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startDate,isDeadLine,color,status);

@override
String toString() {
  return 'EventCalendar(id: $id, title: $title, description: $description, startDate: $startDate, isDeadLine: $isDeadLine, color: $color, status: $status)';
}


}

/// @nodoc
abstract mixin class _$EventCalendarCopyWith<$Res> implements $EventCalendarCopyWith<$Res> {
  factory _$EventCalendarCopyWith(_EventCalendar value, $Res Function(_EventCalendar) _then) = __$EventCalendarCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startDate, bool isDeadLine,@ColorConverter() Color color, String status
});




}
/// @nodoc
class __$EventCalendarCopyWithImpl<$Res>
    implements _$EventCalendarCopyWith<$Res> {
  __$EventCalendarCopyWithImpl(this._self, this._then);

  final _EventCalendar _self;
  final $Res Function(_EventCalendar) _then;

/// Create a copy of EventCalendar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startDate = null,Object? isDeadLine = null,Object? color = null,Object? status = null,}) {
  return _then(_EventCalendar(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,isDeadLine: null == isDeadLine ? _self.isDeadLine : isDeadLine // ignore: cast_nullable_to_non_nullable
as bool,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
