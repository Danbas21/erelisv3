import 'package:erelis/config/result.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_repository.dart';

import '../entities/unit.dart';

class MarkUnitAsCompleteUseCase {
  final UnitsRepository repository;

  MarkUnitAsCompleteUseCase(this.repository);

  Future<Result<Unit>> call(String unidadId, String courseId) async {
    return await repository.markUnitAsComplete(unidadId, courseId);
  }
}
