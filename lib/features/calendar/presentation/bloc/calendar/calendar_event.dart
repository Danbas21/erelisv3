part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.started() = Started;

  const factory CalendarEvent.updateEventStatus({
    required String eventId,
    required String newStatus,
  }) = UpdateEventStatus;

  const factory CalendarEvent.calculateDaysRemaining() =
      CalculateDaysRemaining;

  const factory CalendarEvent.getEvents() = GetEvents;

  const factory CalendarEvent.getDeadlineDate() = GetDeadlineDate;

  const factory CalendarEvent.dateSelected(
    final DateTime selectedDay,
    final DateTime focusedDay,
  ) = DaySelected;

  const factory CalendarEvent.formatChanged({final dynamic format}) =
      FormatChanged;

  const factory CalendarEvent.pageChanged(final DateTime focusedDay) =
      PageChanged;

  const factory CalendarEvent.eventStatusChanged({
    required String eventId,
    required String newStatus,
  }) = EventStatusChanged;

  const factory CalendarEvent.eventAdded(final EventCalendar event) =
      EventAdded;

  const factory CalendarEvent.eventDeleted(final String eventId) =
      EventDeleted;
}