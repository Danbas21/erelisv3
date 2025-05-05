import 'package:erelis/features/calendar/domain/repository/event_repository.dart';

class CalculateDaysRemainingUseCase {
  final EventRepository repository;

  CalculateDaysRemainingUseCase(this.repository);

  Future<int> call() async {
    final deadlineDate = await repository.getDeadlineDate();
    if (deadlineDate == null) {
      return 0;
    }

    final now = DateTime.now();
    final difference = deadlineDate.difference(now);
    return difference.inDays + 1; // +1 para incluir el día actual
  }
}
