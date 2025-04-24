import 'package:bloc/bloc.dart';
import 'package:erelis/config/failures.dart';
import 'package:erelis/config/result.dart';
import 'package:erelis/features/unidad/domain/entities/unit_user_data.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'use_progress_state.dart';
part 'use_progress_event.dart';
part 'use_progress_bloc.freezed.dart';

class UnitProgressBloc extends Bloc<UnitProgressEvent, UnitProgressState> {
  final UnitProgressRepository repository;

  UnitProgressBloc({required this.repository})
    : super(const InitialProgress()) {
    on<_LoadProgress>(_onLoadProgress);
    on<_MarkAsCompleted>(_onMarkAsCompleted);
  }

  Future<void> _onLoadProgress(
    _LoadProgress event,
    Emitter<UnitProgressState> emit,
  ) async {
    emit(const LoadingProgress());
    final result = await repository.getUnitProgress(
      event.unitId,
      '', // Puedes quitar courseId si no lo necesitas aquí
      event.userId,
    );

    switch (result) {
      case Success(:final value):
        emit(LoadedProgress(progreso: value));
        break;
      case Failure(:final error):
        emit(ErrorProgress(error.message ?? 'Error al cargar progreso'));
        break;
    }
  }

  Future<void> _onMarkAsCompleted(
    _MarkAsCompleted event,
    Emitter<UnitProgressState> emit,
  ) async {
    emit(const LoadingProgress());

    final result = await repository.setUnitProgress(
      event.unitId,
      event.courseId,
      event.userId,
      true,
      event.title,
    );

    switch (result) {
      case Success():
        emit(const CompletedProgress());
        break;
      case Failure(:final error):
        emit(ErrorProgress(error.message ?? 'Error al guardar progreso'));
        break;
    }
  }
}
