part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.started() = _Started;

  const factory CalendarEvent.updateEventStatus({
    required String eventId,
    required String newStatus,
  }) = _UpdateEventStatus;

  const factory CalendarEvent.calculateDaysRemaining() =
      _CalculateDaysRemaining;

  const factory CalendarEvent.getEvents() = _GetEvents;

  const factory CalendarEvent.getDeadlineDate() = _GetDeadlineDate;

  const factory CalendarEvent.dateSelected(
    final DateTime selectedDay,
    final DateTime focusedDay,
  ) = _DaySelected;

  const factory CalendarEvent.formatChanged({final dynamic format}) =
      _FormatChanged;

  const factory CalendarEvent.pageChanged(final DateTime focusedDay) =
      _PageChanged;

  const factory CalendarEvent.eventStatusChanged({
    required String eventId,
    required String newStatus,
  }) = _EventStatusChanged;

  const factory CalendarEvent.eventAdded(final EventCalendar event) =
      _EventAdded;

  const factory CalendarEvent.eventDeleted(final String eventId) =
      _EventDeleted;
}
