import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/unidad/domain/entities/unit_user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_progress_model.freezed.dart';
part 'unit_progress_model.g.dart';

@freezed
sealed class UnitProgressModel with _$UnitProgressModel {
  const UnitProgressModel._();

  const factory UnitProgressModel({
    required String unitId,
    required String courseId,
    required String userId,
    required DateTime fechaCompletado,
    required bool isComplete,
    required String title,
  }) = _UnitProgressModel;

  factory UnitProgressModel.fromJson(Map<String, dynamic> json) =>
      _$UnitProgressModelFromJson(json);

  factory UnitProgressModel.fromFirestore(
    Map<String, dynamic> firestoreData,
    String docId,
  ) {
    return UnitProgressModel(
      unitId: docId,
      courseId: firestoreData['courseId'] ?? '',
      userId: firestoreData['userId'] ?? '',
      isComplete: firestoreData['isComplete'],
      title: firestoreData['title'] ?? '',
      fechaCompletado:
          firestoreData['fechaCompletado'] != null
              ? (firestoreData['fechaCompletado'] as Timestamp).toDate()
              : DateTime.now(),
    );
  }

  UnidadProgreso toEntity() {
    return UnidadProgreso(
      unidadId: unitId,
      userId: userId,
      courseId: courseId,
      title: title,
      isCompleted: isComplete,
      fechaCompletado: fechaCompletado,
    );
  }
}
