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


class Started implements CalendarEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.started()';
}


}




/// @nodoc


class UpdateEventStatus implements CalendarEvent {
  const UpdateEventStatus({required this.eventId, required this.newStatus});
  

 final  String eventId;
 final  String newStatus;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateEventStatusCopyWith<UpdateEventStatus> get copyWith => _$UpdateEventStatusCopyWithImpl<UpdateEventStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateEventStatus&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus));
}


@override
int get hashCode => Object.hash(runtimeType,eventId,newStatus);

@override
String toString() {
  return 'CalendarEvent.updateEventStatus(eventId: $eventId, newStatus: $newStatus)';
}


}

/// @nodoc
abstract mixin class $UpdateEventStatusCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $UpdateEventStatusCopyWith(UpdateEventStatus value, $Res Function(UpdateEventStatus) _then) = _$UpdateEventStatusCopyWithImpl;
@useResult
$Res call({
 String eventId, String newStatus
});




}
/// @nodoc
class _$UpdateEventStatusCopyWithImpl<$Res>
    implements $UpdateEventStatusCopyWith<$Res> {
  _$UpdateEventStatusCopyWithImpl(this._self, this._then);

  final UpdateEventStatus _self;
  final $Res Function(UpdateEventStatus) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? newStatus = null,}) {
  return _then(UpdateEventStatus(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CalculateDaysRemaining implements CalendarEvent {
  const CalculateDaysRemaining();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculateDaysRemaining);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.calculateDaysRemaining()';
}


}




/// @nodoc


class GetEvents implements CalendarEvent {
  const GetEvents();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.getEvents()';
}


}




/// @nodoc


class GetDeadlineDate implements CalendarEvent {
  const GetDeadlineDate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDeadlineDate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.getDeadlineDate()';
}


}




/// @nodoc


class DaySelected implements CalendarEvent {
  const DaySelected(this.selectedDay, this.focusedDay);
  

 final  DateTime selectedDay;
 final  DateTime focusedDay;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaySelectedCopyWith<DaySelected> get copyWith => _$DaySelectedCopyWithImpl<DaySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaySelected&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay,focusedDay);

@override
String toString() {
  return 'CalendarEvent.dateSelected(selectedDay: $selectedDay, focusedDay: $focusedDay)';
}


}

/// @nodoc
abstract mixin class $DaySelectedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $DaySelectedCopyWith(DaySelected value, $Res Function(DaySelected) _then) = _$DaySelectedCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDay, DateTime focusedDay
});




}
/// @nodoc
class _$DaySelectedCopyWithImpl<$Res>
    implements $DaySelectedCopyWith<$Res> {
  _$DaySelectedCopyWithImpl(this._self, this._then);

  final DaySelected _self;
  final $Res Function(DaySelected) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedDay = null,Object? focusedDay = null,}) {
  return _then(DaySelected(
null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class FormatChanged implements CalendarEvent {
  const FormatChanged({this.format});
  

 final  dynamic format;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormatChangedCopyWith<FormatChanged> get copyWith => _$FormatChangedCopyWithImpl<FormatChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatChanged&&const DeepCollectionEquality().equals(other.format, format));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(format));

@override
String toString() {
  return 'CalendarEvent.formatChanged(format: $format)';
}


}

/// @nodoc
abstract mixin class $FormatChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $FormatChangedCopyWith(FormatChanged value, $Res Function(FormatChanged) _then) = _$FormatChangedCopyWithImpl;
@useResult
$Res call({
 dynamic format
});




}
/// @nodoc
class _$FormatChangedCopyWithImpl<$Res>
    implements $FormatChangedCopyWith<$Res> {
  _$FormatChangedCopyWithImpl(this._self, this._then);

  final FormatChanged _self;
  final $Res Function(FormatChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? format = freezed,}) {
  return _then(FormatChanged(
format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class PageChanged implements CalendarEvent {
  const PageChanged(this.focusedDay);
  

 final  DateTime focusedDay;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageChangedCopyWith<PageChanged> get copyWith => _$PageChangedCopyWithImpl<PageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageChanged&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDay);

@override
String toString() {
  return 'CalendarEvent.pageChanged(focusedDay: $focusedDay)';
}


}

/// @nodoc
abstract mixin class $PageChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $PageChangedCopyWith(PageChanged value, $Res Function(PageChanged) _then) = _$PageChangedCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDay
});




}
/// @nodoc
class _$PageChangedCopyWithImpl<$Res>
    implements $PageChangedCopyWith<$Res> {
  _$PageChangedCopyWithImpl(this._self, this._then);

  final PageChanged _self;
  final $Res Function(PageChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDay = null,}) {
  return _then(PageChanged(
null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class EventStatusChanged implements CalendarEvent {
  const EventStatusChanged({required this.eventId, required this.newStatus});
  

 final  String eventId;
 final  String newStatus;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventStatusChangedCopyWith<EventStatusChanged> get copyWith => _$EventStatusChangedCopyWithImpl<EventStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventStatusChanged&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus));
}


@override
int get hashCode => Object.hash(runtimeType,eventId,newStatus);

@override
String toString() {
  return 'CalendarEvent.eventStatusChanged(eventId: $eventId, newStatus: $newStatus)';
}


}

/// @nodoc
abstract mixin class $EventStatusChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $EventStatusChangedCopyWith(EventStatusChanged value, $Res Function(EventStatusChanged) _then) = _$EventStatusChangedCopyWithImpl;
@useResult
$Res call({
 String eventId, String newStatus
});




}
/// @nodoc
class _$EventStatusChangedCopyWithImpl<$Res>
    implements $EventStatusChangedCopyWith<$Res> {
  _$EventStatusChangedCopyWithImpl(this._self, this._then);

  final EventStatusChanged _self;
  final $Res Function(EventStatusChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? newStatus = null,}) {
  return _then(EventStatusChanged(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EventAdded implements CalendarEvent {
  const EventAdded(this.event);
  

 final  EventCalendar event;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventAddedCopyWith<EventAdded> get copyWith => _$EventAddedCopyWithImpl<EventAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventAdded&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString() {
  return 'CalendarEvent.eventAdded(event: $event)';
}


}

/// @nodoc
abstract mixin class $EventAddedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $EventAddedCopyWith(EventAdded value, $Res Function(EventAdded) _then) = _$EventAddedCopyWithImpl;
@useResult
$Res call({
 EventCalendar event
});


$EventCalendarCopyWith<$Res> get event;

}
/// @nodoc
class _$EventAddedCopyWithImpl<$Res>
    implements $EventAddedCopyWith<$Res> {
  _$EventAddedCopyWithImpl(this._self, this._then);

  final EventAdded _self;
  final $Res Function(EventAdded) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(EventAdded(
null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventCalendar,
  ));
}

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventCalendarCopyWith<$Res> get event {
  
  return $EventCalendarCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class EventDeleted implements CalendarEvent {
  const EventDeleted(this.eventId);
  

 final  String eventId;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDeletedCopyWith<EventDeleted> get copyWith => _$EventDeletedCopyWithImpl<EventDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDeleted&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'CalendarEvent.eventDeleted(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class $EventDeletedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $EventDeletedCopyWith(EventDeleted value, $Res Function(EventDeleted) _then) = _$EventDeletedCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class _$EventDeletedCopyWithImpl<$Res>
    implements $EventDeletedCopyWith<$Res> {
  _$EventDeletedCopyWithImpl(this._self, this._then);

  final EventDeleted _self;
  final $Res Function(EventDeleted) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(EventDeleted(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

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


class Initial implements CalendarState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState.initial()';
}


}




/// @nodoc


class Loading implements CalendarState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState.loading()';
}


}




/// @nodoc


class Loaded implements CalendarState {
  const Loaded({required this.focusedDay, required this.selectedDay, required this.calendarFormat, required final  List<EventCalendar> selectedEvents, required this.daysRemaining, this.deadlineEvent}): _selectedEvents = selectedEvents;
  

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
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.calendarFormat, calendarFormat) || other.calendarFormat == calendarFormat)&&const DeepCollectionEquality().equals(other._selectedEvents, _selectedEvents)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.deadlineEvent, deadlineEvent) || other.deadlineEvent == deadlineEvent));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDay,selectedDay,calendarFormat,const DeepCollectionEquality().hash(_selectedEvents),daysRemaining,deadlineEvent);

@override
String toString() {
  return 'CalendarState.loaded(focusedDay: $focusedDay, selectedDay: $selectedDay, calendarFormat: $calendarFormat, selectedEvents: $selectedEvents, daysRemaining: $daysRemaining, deadlineEvent: $deadlineEvent)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDay, DateTime selectedDay, CalendarFormat calendarFormat, List<EventCalendar> selectedEvents, int daysRemaining, EventCalendar? deadlineEvent
});


$EventCalendarCopyWith<$Res>? get deadlineEvent;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDay = null,Object? selectedDay = null,Object? calendarFormat = null,Object? selectedEvents = null,Object? daysRemaining = null,Object? deadlineEvent = freezed,}) {
  return _then(Loaded(
focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,calendarFormat: null == calendarFormat ? _self.calendarFormat : calendarFormat // ignore: cast_nullable_to_non_nullable
as CalendarFormat,selectedEvents: null == selectedEvents ? _self._selectedEvents : selectedEvents // ignore: cast_nullable_to_non_nullable
as List<EventCalendar>,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,deadlineEvent: freezed == deadlineEvent ? _self.deadlineEvent : deadlineEvent // ignore: cast_nullable_to_non_nullable
as EventCalendar?,
  ));
}

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventCalendarCopyWith<$Res>? get deadlineEvent {
    if (_self.deadlineEvent == null) {
    return null;
  }

  return $EventCalendarCopyWith<$Res>(_self.deadlineEvent!, (value) {
    return _then(_self.copyWith(deadlineEvent: value));
  });
}
}

/// @nodoc


class Error implements CalendarState {
  const Error({this.errorMessage});
  

 final  String? errorMessage;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CalendarState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String? errorMessage
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,}) {
  return _then(Error(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
