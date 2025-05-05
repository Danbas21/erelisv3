// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState()';
}


}

/// @nodoc
class $CalendarStateCopyWith<$Res>  {
$CalendarStateCopyWith(CalendarState _, $Res Function(CalendarState) __);
}


/// @nodoc


class _Initial implements CalendarState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState.initial()';
}


}




/// @nodoc


class _Loading implements CalendarState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState.loading()';
}


}




/// @nodoc


class _Loaded implements CalendarState {
  const _Loaded({required this.focusedDay, required this.selectedDay, required this.calendarFormat, required final  List<EventCalendar> selectedEvents, required this.daysRemaining, this.deadlineEvent}): _selectedEvents = selectedEvents;
  

 final  DateTime focusedDay;
 final  DateTime selectedDay;
 final  CalendarFormat calendarFormat;
 final  List<EventCalendar> _selectedEvents;
 List<EventCalendar> get selectedEvents {
  if (_selectedEvents is EqualUnmodifiableListView) return _selectedEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEvents);
}

 final  int daysRemaining;
 final  EventCalendar? deadlineEvent;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other.calendarFormat, calendarFormat)&&const DeepCollectionEquality().equals(other._selectedEvents, _selectedEvents)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&const DeepCollectionEquality().equals(other.deadlineEvent, deadlineEvent));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDay,selectedDay,const DeepCollectionEquality().hash(calendarFormat),const DeepCollectionEquality().hash(_selectedEvents),daysRemaining,const DeepCollectionEquality().hash(deadlineEvent));

@override
String toString() {
  return 'CalendarState.loaded(focusedDay: $focusedDay, selectedDay: $selectedDay, calendarFormat: $calendarFormat, selectedEvents: $selectedEvents, daysRemaining: $daysRemaining, deadlineEvent: $deadlineEvent)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDay, DateTime selectedDay, CalendarFormat calendarFormat, List<EventCalendar> selectedEvents, int daysRemaining, EventCalendar? deadlineEvent
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDay = null,Object? selectedDay = null,Object? calendarFormat = freezed,Object? selectedEvents = null,Object? daysRemaining = null,Object? deadlineEvent = freezed,}) {
  return _then(_Loaded(
focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,calendarFormat: freezed == calendarFormat ? _self.calendarFormat : calendarFormat // ignore: cast_nullable_to_non_nullable
as CalendarFormat,selectedEvents: null == selectedEvents ? _self._selectedEvents : selectedEvents // ignore: cast_nullable_to_non_nullable
as List<EventCalendar>,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,deadlineEvent: freezed == deadlineEvent ? _self.deadlineEvent : deadlineEvent // ignore: cast_nullable_to_non_nullable
as EventCalendar?,
  ));
}


}

/// @nodoc


class _Error implements CalendarState {
  const _Error({this.errorMessage});
  

 final  String? errorMessage;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CalendarState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String? errorMessage
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,}) {
  return _then(_Error(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CalendarEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent()';
}


}

/// @nodoc
class $CalendarEventCopyWith<$Res>  {
$CalendarEventCopyWith(CalendarEvent _, $Res Function(CalendarEvent) __);
}


/// @nodoc


class _Started implements CalendarEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.started()';
}


}




/// @nodoc


class _UpdateEventStatus implements CalendarEvent {
  const _UpdateEventStatus({required this.eventId, required this.newStatus});
  

 final  String eventId;
 final  String newStatus;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateEventStatusCopyWith<_UpdateEventStatus> get copyWith => __$UpdateEventStatusCopyWithImpl<_UpdateEventStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateEventStatus&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus));
}


@override
int get hashCode => Object.hash(runtimeType,eventId,newStatus);

@override
String toString() {
  return 'CalendarEvent.updateEventStatus(eventId: $eventId, newStatus: $newStatus)';
}


}

/// @nodoc
abstract mixin class _$UpdateEventStatusCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$UpdateEventStatusCopyWith(_UpdateEventStatus value, $Res Function(_UpdateEventStatus) _then) = __$UpdateEventStatusCopyWithImpl;
@useResult
$Res call({
 String eventId, String newStatus
});




}
/// @nodoc
class __$UpdateEventStatusCopyWithImpl<$Res>
    implements _$UpdateEventStatusCopyWith<$Res> {
  __$UpdateEventStatusCopyWithImpl(this._self, this._then);

  final _UpdateEventStatus _self;
  final $Res Function(_UpdateEventStatus) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? newStatus = null,}) {
  return _then(_UpdateEventStatus(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CalculateDaysRemaining implements CalendarEvent {
  const _CalculateDaysRemaining();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculateDaysRemaining);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.calculateDaysRemaining()';
}


}




/// @nodoc


class _GetEvents implements CalendarEvent {
  const _GetEvents();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.getEvents()';
}


}




/// @nodoc


class _GetDeadlineDate implements CalendarEvent {
  const _GetDeadlineDate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDeadlineDate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.getDeadlineDate()';
}


}




/// @nodoc


class _DaySelected implements CalendarEvent {
  const _DaySelected(this.selectedDay, this.focusedDay);
  

 final  DateTime selectedDay;
 final  DateTime focusedDay;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaySelectedCopyWith<_DaySelected> get copyWith => __$DaySelectedCopyWithImpl<_DaySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaySelected&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay,focusedDay);

@override
String toString() {
  return 'CalendarEvent.dateSelected(selectedDay: $selectedDay, focusedDay: $focusedDay)';
}


}

/// @nodoc
abstract mixin class _$DaySelectedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$DaySelectedCopyWith(_DaySelected value, $Res Function(_DaySelected) _then) = __$DaySelectedCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDay, DateTime focusedDay
});




}
/// @nodoc
class __$DaySelectedCopyWithImpl<$Res>
    implements _$DaySelectedCopyWith<$Res> {
  __$DaySelectedCopyWithImpl(this._self, this._then);

  final _DaySelected _self;
  final $Res Function(_DaySelected) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedDay = null,Object? focusedDay = null,}) {
  return _then(_DaySelected(
null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _FormatChanged implements CalendarEvent {
  const _FormatChanged({this.format});
  

 final  dynamic format;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormatChangedCopyWith<_FormatChanged> get copyWith => __$FormatChangedCopyWithImpl<_FormatChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormatChanged&&const DeepCollectionEquality().equals(other.format, format));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(format));

@override
String toString() {
  return 'CalendarEvent.formatChanged(format: $format)';
}


}

/// @nodoc
abstract mixin class _$FormatChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$FormatChangedCopyWith(_FormatChanged value, $Res Function(_FormatChanged) _then) = __$FormatChangedCopyWithImpl;
@useResult
$Res call({
 dynamic format
});




}
/// @nodoc
class __$FormatChangedCopyWithImpl<$Res>
    implements _$FormatChangedCopyWith<$Res> {
  __$FormatChangedCopyWithImpl(this._self, this._then);

  final _FormatChanged _self;
  final $Res Function(_FormatChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? format = freezed,}) {
  return _then(_FormatChanged(
format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class _PageChanged implements CalendarEvent {
  const _PageChanged(this.focusedDay);
  

 final  DateTime focusedDay;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageChangedCopyWith<_PageChanged> get copyWith => __$PageChangedCopyWithImpl<_PageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageChanged&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDay);

@override
String toString() {
  return 'CalendarEvent.pageChanged(focusedDay: $focusedDay)';
}


}

/// @nodoc
abstract mixin class _$PageChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$PageChangedCopyWith(_PageChanged value, $Res Function(_PageChanged) _then) = __$PageChangedCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDay
});




}
/// @nodoc
class __$PageChangedCopyWithImpl<$Res>
    implements _$PageChangedCopyWith<$Res> {
  __$PageChangedCopyWithImpl(this._self, this._then);

  final _PageChanged _self;
  final $Res Function(_PageChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDay = null,}) {
  return _then(_PageChanged(
null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _EventStatusChanged implements CalendarEvent {
  const _EventStatusChanged({required this.eventId, required this.newStatus});
  

 final  String eventId;
 final  String newStatus;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventStatusChangedCopyWith<_EventStatusChanged> get copyWith => __$EventStatusChangedCopyWithImpl<_EventStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventStatusChanged&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus));
}


@override
int get hashCode => Object.hash(runtimeType,eventId,newStatus);

@override
String toString() {
  return 'CalendarEvent.eventStatusChanged(eventId: $eventId, newStatus: $newStatus)';
}


}

/// @nodoc
abstract mixin class _$EventStatusChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$EventStatusChangedCopyWith(_EventStatusChanged value, $Res Function(_EventStatusChanged) _then) = __$EventStatusChangedCopyWithImpl;
@useResult
$Res call({
 String eventId, String newStatus
});




}
/// @nodoc
class __$EventStatusChangedCopyWithImpl<$Res>
    implements _$EventStatusChangedCopyWith<$Res> {
  __$EventStatusChangedCopyWithImpl(this._self, this._then);

  final _EventStatusChanged _self;
  final $Res Function(_EventStatusChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? newStatus = null,}) {
  return _then(_EventStatusChanged(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventAdded implements CalendarEvent {
  const _EventAdded(this.event);
  

 final  EventCalendar event;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventAddedCopyWith<_EventAdded> get copyWith => __$EventAddedCopyWithImpl<_EventAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventAdded&&const DeepCollectionEquality().equals(other.event, event));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(event));

@override
String toString() {
  return 'CalendarEvent.eventAdded(event: $event)';
}


}

/// @nodoc
abstract mixin class _$EventAddedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$EventAddedCopyWith(_EventAdded value, $Res Function(_EventAdded) _then) = __$EventAddedCopyWithImpl;
@useResult
$Res call({
 EventCalendar event
});




}
/// @nodoc
class __$EventAddedCopyWithImpl<$Res>
    implements _$EventAddedCopyWith<$Res> {
  __$EventAddedCopyWithImpl(this._self, this._then);

  final _EventAdded _self;
  final $Res Function(_EventAdded) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(_EventAdded(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventCalendar,
  ));
}


}

/// @nodoc


class _EventDeleted implements CalendarEvent {
  const _EventDeleted(this.eventId);
  

 final  String eventId;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDeletedCopyWith<_EventDeleted> get copyWith => __$EventDeletedCopyWithImpl<_EventDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDeleted&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'CalendarEvent.eventDeleted(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$EventDeletedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$EventDeletedCopyWith(_EventDeleted value, $Res Function(_EventDeleted) _then) = __$EventDeletedCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class __$EventDeletedCopyWithImpl<$Res>
    implements _$EventDeletedCopyWith<$Res> {
  __$EventDeletedCopyWithImpl(this._self, this._then);

  final _EventDeleted _self;
  final $Res Function(_EventDeleted) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(_EventDeleted(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
