part of 'use_progress_bloc.dart';

@freezed
sealed class UnitProgressState with _$UnitProgressState {
  const factory UnitProgressState.initial() = InitialProgress;
  const factory UnitProgressState.loading() = LoadingProgress;
  const factory UnitProgressState.loaded({required UnidadProgreso progreso}) =
      LoadedProgress;
  const factory UnitProgressState.completed() = CompletedProgress;
  const factory UnitProgressState.error(String message) = ErrorProgress;
}
