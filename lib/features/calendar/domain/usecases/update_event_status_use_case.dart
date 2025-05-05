import 'package:erelis/features/calendar/domain/repository/event_repository.dart';

class UpdateEventStatusUseCase {
  final EventRepository repository;

  UpdateEventStatusUseCase(this.repository);

  Future<void> call(String eventId, String newStatus) async {
    final events = await repository.getEvents();
    final event = events.firstWhere((e) => e.id == eventId);

    await repository.updateEvent(event.copyWith(status: newStatus));
  }
}
