part of 'use_progress_bloc.dart';

@freezed
sealed class UnitProgressEvent with _$UnitProgressEvent {
  const factory UnitProgressEvent.loadProgress({
    required String userId,
    required String unitId,
  }) = _LoadProgress;

  const factory UnitProgressEvent.markAsCompleted({
    required String userId,
    required String unitId,
    required String courseId,
    required String title,
  }) = _MarkAsCompleted;
}
