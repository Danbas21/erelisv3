part of 'salon_bloc.dart';

enum SalonStatus {
  initial,
  loading,
  loaded,
  detailsLoaded,
  error,
  operationSuccess,
}

@freezed
sealed class SalonState with _$SalonState {
  const factory SalonState({
    @Default(SalonStatus.initial) SalonStatus status,
    @Default([]) List<dynamic> subject,
    @Default('') String errorMessage,
    @Default('') String operationMessage,
    @Default(true)
    bool isSidebarExpanded, // Añadido para controlar el estado del sidebar
  }) = _SalonState;

  const SalonState._();

  // Métodos de ayuda para facilitar la comprobación del estado
  bool get isInitial => status == SalonStatus.initial;
  bool get isLoading => status == SalonStatus.loading;
  bool get isLoaded => status == SalonStatus.loaded;
  bool get isDetailsLoaded => status == SalonStatus.detailsLoaded;
  bool get isError => status == SalonStatus.error;
  bool get isOperationSuccess => status == SalonStatus.operationSuccess;
}

// Estos son los estados específicos que puedes usar si prefieres un enfoque más directo
// y que no contradiga el enfoque anterior usando freezed
