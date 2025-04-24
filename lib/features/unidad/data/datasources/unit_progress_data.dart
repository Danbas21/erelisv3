import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/unidad/data/models/unit_progress_model.dart';

abstract class UnitProgressDataSource {
  Future<void> setUnitProgress(
    String unitId,
    String courseId,
    String userId,
    bool isComplete,
    String title,
  );
  Future<bool> getUnitProgress(String userId, String unitId, String courseId);

  Future<void> deleteUnitProgress(String userId, String courseId);
}

class UnitProgressDataSourceImpl implements UnitProgressDataSource {
  final FirebaseFirestore firestore;

  UnitProgressDataSourceImpl({required this.firestore});

  @override
  Future<void> deleteUnitProgress(String userId, String courseId) async {
    // Eliminar todo el progreso de unidades de un curso
    final snapshot =
        await firestore
            .collection('user_progress')
            .doc(userId)
            .collection('unit_progress')
            .where('courseId', isEqualTo: courseId)
            .get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<bool> getUnitProgress(
    String unitId,
    String courseId,
    String userId,
  ) async {
    try {
      final doc =
          await firestore
              .collection('user_progress')
              .doc(userId)
              .collection('unit_progress') // ← accede a unidad específica
              .doc(unitId)
              .get();

      if (doc.exists) {
        final data = doc.data()!;
        return data['isComplete'] as bool? ?? false;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> setUnitProgress(
    String unitId,
    String courseId,
    String userId,
    bool isComplete,
    String title,
  ) {
    // TODO: implement setUnitProgress
    return firestore
        .collection('user_progress')
        .doc(userId)
        .collection('unit_progress') // ← unidad específica
        .doc(unitId)
        .set(
          UnitProgressModel(
            unitId: unitId,
            courseId: courseId,
            userId: userId,
            isComplete: isComplete,
            title: title,
            fechaCompletado: DateTime.now(),
          ).toJson(),
        );
  }
}
