// lib/domain/usecases/get_events_use_case.dart
import '../entities/event.dart';
import '../repository/event_repository.dart';

class GetEventsUseCase {
  final EventRepository repository;

  GetEventsUseCase(this.repository);

  Future<List<EventCalendar>> call() async {
    return await repository.getEvents();
  }
}
