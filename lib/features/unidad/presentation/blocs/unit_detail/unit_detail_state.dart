part of 'unit_detail_bloc.dart';

@freezed
sealed class HighlightData with _$HighlightData {
  const factory HighlightData({required String text, required String color}) =
      _HighlightData;
}

@freezed
sealed class UnitDetailState with _$UnitDetailState {
  const factory UnitDetailState.initial() = InitialDetail;
  const factory UnitDetailState.loading() = LoadingDetail;
  const factory UnitDetailState.loaded({
    required Unit unit,
    required List<HighlightData> highlights,
  }) = LoadedDetail;
  const factory UnitDetailState.error(String message) = ErrorDetail;
}
