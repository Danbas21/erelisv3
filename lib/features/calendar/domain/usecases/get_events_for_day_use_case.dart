// lib/domain/usecases/get_events_for_day_use_case.dart
import '../entities/event.dart';
import '../repository/event_repository.dart';

class GetEventsForDayUseCase {
  final EventRepository repository;

  GetEventsForDayUseCase(this.repository);

  Future<List<EventCalendar>> call(DateTime day) async {
    return await repository.getEventsForDay(day);
  }
}
