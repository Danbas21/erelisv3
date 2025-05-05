import 'package:erelis/features/calendar/data/datasources/local_event_data_source.dart';
import 'package:erelis/features/calendar/domain/entities/event.dart';
import 'package:erelis/features/calendar/domain/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final LocalEventDataSource dataSource;

  EventRepositoryImpl(this.dataSource);

  @override
  Future<List<EventCalendar>> getEvents() async {
    return dataSource.getAllEvents();
  }

  @override
  Future<List<EventCalendar>> getEventsForDay(DateTime day) async {
    return dataSource.getEventsForDay(day);
  }

  @override
  Future<void> addEvent(EventCalendar event) async {
    dataSource.addEvent(event);
  }

  @override
  Future<void> deleteEvent(String id) async {
    dataSource.deleteEvent(id);
  }

  @override
  Future<void> updateEvent(EventCalendar event) async {
    dataSource.updateEvent(event);
  }

  @override
  Future<DateTime?> getDeadlineDate() async {
    return dataSource.getDeadlineDate();
  }

  @override
  Future<EventCalendar?> getDeadlineEvent() async {
    return dataSource.getDeadlineEvent();
  }
}
