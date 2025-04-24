import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/config/failures.dart';
import 'package:erelis/config/result.dart';
import 'package:erelis/features/unidad/data/datasources/unit_progress_data.dart';
import 'package:erelis/features/unidad/data/models/unit_progress_model.dart';

import 'package:erelis/features/unidad/domain/entities/unit_user_data.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_progress.dart';

class AdapterProgress implements UnitProgressRepository {
  final UnitProgressDataSource dataSource;

  AdapterProgress({required this.dataSource});

  @override
  Future<Result<void>> deleteUnitProgress(
    String userId,
    String courseId,
  ) async {
    try {
      await dataSource.deleteUnitProgress(userId, courseId);
      return Success(null);
    } catch (e) {
      return Error(Failure(mensaje: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Result<UnidadProgreso>> getUnitProgress(
    String unitId,
    String courseId,
    String userId,
  ) async {
    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('user_progress')
              .doc(userId)
              .collection('unit_progress')
              .doc(unitId)
              .get();

      if (!doc.exists) {
        return Error(
          Failure(
            mensaje: "Unidad no encontrada",
            message: "Unidad no encontrada",
          ),
        );
      }

      final model = UnitProgressModel.fromFirestore(doc.data()!, doc.id);
      return Success(model.toEntity());
    } catch (e) {
      return Error(Failure(mensaje: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Result<void>> setUnitProgress(
    String unitId,
    String courseId,
    String userId,
    bool isComplete,
    String title,
  ) async {
    try {
      await dataSource.setUnitProgress(
        unitId,
        courseId,
        userId,
        isComplete,
        title,
      );
      return Success(null);
    } catch (e) {
      return Error(Failure(mensaje: e.toString(), message: e.toString()));
    }
  }
}
