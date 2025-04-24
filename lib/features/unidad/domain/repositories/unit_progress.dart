import 'package:erelis/config/result.dart';

import 'package:erelis/features/unidad/domain/entities/unit_user_data.dart';

abstract class UnitProgressRepository {
  Future<Result<UnidadProgreso>> getUnitProgress(
    String unitId,
    String courseId,
    String userId,
  );
  Future<Result<void>> setUnitProgress(
    String unitId,
    String courseId,
    String userId,
    bool isComplete,
    String title,
  );
  Future<Result<void>> deleteUnitProgress(String userId, String courseId);
}
