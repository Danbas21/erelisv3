import 'package:bloc/bloc.dart';
import 'package:erelis/config/result.dart';
import 'package:erelis/features/unidad/domain/entities/unit.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_detail_state.dart';
part 'unit_detail_event.dart';
part 'unit_detail_bloc.freezed.dart';

// presentation/bloc/unit_detail/unit_detail_bloc.dart

class UnitDetailBloc extends Bloc<UnitDetailEvent, UnitDetailState> {
  final UnitsRepository repository;

  UnitDetailBloc({required this.repository})
    : super(const UnitDetailState.initial()) {
    on<UnitDetailEvent>((event, emit) async {
      switch (event) {
        case _LoadUnit loadUnit:
          await _onLoadUnit(loadUnit, emit);
          break;
        case _HighlightText highlightText:
          _onHighlightText(highlightText, emit);
          break;
      }
    });
  }

  Future<void> _onLoadUnit(
    _LoadUnit event,
    Emitter<UnitDetailState> emit,
  ) async {
    emit(const UnitDetailState.loading());

    try {
      await emit.forEach(
        repository.getUnitById(event.unitId, event.courseId),
        onData: (result) {
          print("Stream recibió resultado: $result");

          return switch (result) {
            // Verificar explícitamente que la unidad no sea null
            Success(value: final unit) => UnitDetailState.loaded(
              unit: unit,
              highlights: const [],
            ),
            // Manejar explícitamente el caso de unit null
            // ignore: constant_pattern_never_matches_value_type
            Success(value: null) => UnitDetailState.error(
              'Error: La unidad recibida es null',
            ),
            ErrorDetail(message: final message) => UnitDetailState.error(
              'No se pudo cargar la unidad: $message',
            ),
            _ => UnitDetailState.error('Resultado inesperado'),
          };
        },
      );
    } catch (e) {
      print("Excepción en _onLoadUnit: $e");
      emit(UnitDetailState.error('Error inesperado: $e'));
    }
  }

  void _onHighlightText(_HighlightText event, Emitter<UnitDetailState> emit) {
    final currentState = state;

    if (currentState is LoadedDetail) {
      final newHighlight = HighlightData(text: event.text, color: event.color);

      emit(
        UnitDetailState.loaded(
          unit: currentState.unit,
          highlights: [...currentState.highlights, newHighlight],
        ),
      );
    }
  }
}
