import 'package:bloc/bloc.dart';
import 'package:erelis/domain/repositories/event_repository.dart';
import 'package:erelis/features/calendar/domain/entities/event.dart';
import 'package:erelis/features/calendar/domain/usecases/calculate_days_remaining_use_case.dart';
import 'package:erelis/features/calendar/domain/usecases/get_events_for_day_use_case.dart';
import 'package:erelis/features/calendar/domain/usecases/update_event_status_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.dart';
part 'calendar_event.dart';
part 'calendar_bloc.freezed.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final GetEventsForDayUseCase getEventsForDayUseCase;
  final CalculateDaysRemainingUseCase calculateDaysRemainingUseCase;
  final UpdateEventStatusUseCase updateEventStatusUseCase;
  final EventRepository eventRepository;

  CalendarBloc(
    this.getEventsForDayUseCase,
    this.calculateDaysRemainingUseCase,
    this.updateEventStatusUseCase,
    this.eventRepository,
  ) : super(const CalendarState.initial()) {
    on<_Started>(_onInitialized);
    on<_DaySelected>(_onDaySelected);
    on<_FormatChanged>(_onFormatChanged);
    on<_PageChanged>(_onPageChanged);
    on<_EventStatusChanged>(_onEventStatusChanged);
    on<_EventAdded>(_onEventAdded);
    on<_EventDeleted>(_onEventDeleted);
  }

  Future<void> _onInitialized(
    _Started event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      // Obtener eventos para el día seleccionado
      final events = await getEventsForDayUseCase(state.selectedDay);

      // Calcular días restantes para el examen
      final daysRemaining = await calculateDaysRemainingUseCase();

      // Obtener el evento de deadline
      final deadlineEvent = await eventRepository.getDeadlineEvent();

      emit(
        state.copyWith(
          selectedEvents: events,
          daysRemaining: daysRemaining,
          deadlineEvent: deadlineEvent,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onDaySelected(
    _DaySelected event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      if (!_isSameDay(state.selectedDay, event.selectedDay)) {
        final events = await getEventsForDayUseCase(event.selectedDay);

        emit(
          state.copyWith(
            selectedDay: event.selectedDay,
            focusedDay: event.focusedDay,
            selectedEvents: events,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onFormatChanged(_FormatChanged event, Emitter<CalendarState> emit) {
    emit(state.copyWith(calendarFormat: event.format));
  }

  void _onPageChanged(_PageChanged event, Emitter<CalendarState> emit) {
    emit(state.copyWith(focusedDay: event.focusedDay));
  }

  Future<void> _onEventStatusChanged(
    _EventStatusChanged event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      await updateEventStatusUseCase(event.eventId, event.newStatus);

      // Actualizar eventos del día seleccionado
      final updatedEvents = await getEventsForDayUseCase(state.selectedDay);
      emit(state.copyWith(selectedEvents: updatedEvents));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onEventAdded(
    _EventAdded event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      await eventRepository.addEvent(event.event);

      // Actualizar eventos del día seleccionado
      final updatedEvents = await getEventsForDayUseCase(state.selectedDay);
      emit(state.copyWith(selectedEvents: updatedEvents));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onEventDeleted(
    _EventDeleted event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      await eventRepository.deleteEvent(event.eventId);

      // Actualizar eventos del día seleccionado
      final updatedEvents = await getEventsForDayUseCase(state.selectedDay);
      emit(state.copyWith(selectedEvents: updatedEvents));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  bool _isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
