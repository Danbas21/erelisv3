import '../entities/event.dart';

abstract class EventRepository {
  Future<List<EventCalendar>> getEvents();
  Future<List<EventCalendar>> getEventsForDay(DateTime day);
  Future<void> addEvent(EventCalendar event);
  Future<void> deleteEvent(String id);
  Future<void> updateEvent(EventCalendar event);
  Future<DateTime?> getDeadlineDate();
  Future<EventCalendar?> getDeadlineEvent();
}
