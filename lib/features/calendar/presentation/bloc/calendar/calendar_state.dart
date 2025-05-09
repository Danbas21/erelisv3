part of 'calendar_bloc.dart';

@freezed
sealed class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = Initial;

  const factory CalendarState.loading() = Loading;

  const factory CalendarState.loaded({
    required DateTime focusedDay,
    required DateTime selectedDay,
    required CalendarFormat calendarFormat,
    required List<EventCalendar> selectedEvents,
    required int daysRemaining,
    EventCalendar? deadlineEvent,
  }) = Loaded;

  const factory CalendarState.error({String? errorMessage}) = Error;
}