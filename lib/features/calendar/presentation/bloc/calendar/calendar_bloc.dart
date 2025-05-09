import 'package:erelis/features/calendar/domain/entities/event.dart';
import 'package:erelis/features/calendar/domain/repository/event_repository.dart';
import 'package:erelis/features/calendar/domain/usecases/calculate_days_remaining_use_case.dart';
import 'package:erelis/features/calendar/domain/usecases/get_events_for_day_use_case.dart';
import 'package:erelis/features/calendar/domain/usecases/update_event_status_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final GetEventsForDayUseCase getEventsForDayUseCase;
  final CalculateDaysRemainingUseCase calculateDaysRemainingUseCase;
  final UpdateEventStatusUseCase updateEventStatusUseCase;
  final EventRepository eventRepository;

  CalendarBloc({
    required this.getEventsForDayUseCase,
    required this.calculateDaysRemainingUseCase,
    required this.updateEventStatusUseCase,
    required this.eventRepository,
  }) : super(const CalendarState.initial()) {
    on<CalendarEvent>((event, emit) async {
      switch (event) {
        case Started():
          await _onStarted(event, emit);
        case CalculateDaysRemaining():
          await _onCalculateDaysRemaining(event, emit);
        case GetEvents():
          await _onGetEvents(event, emit);
        case GetDeadlineDate():
          await _onGetDeadlineDate(event, emit);
        case DaySelected():
          await _onDaySelected(event, emit);
        case FormatChanged():
          _onFormatChanged(event, emit);
        case PageChanged():
          _onPageChanged(event, emit);
        case EventStatusChanged():
          await _onEventStatusChanged(event, emit);
        case EventAdded():
          await _onEventAdded(event, emit);
        case EventDeleted():
          await _onEventDeleted(event, emit);
      }
    });
  }

  Future<void> _onStarted(
    Started event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      emit(const CalendarState.loading());

      final now = DateTime.now();
      final events = await getEventsForDayUseCase(now);
      final daysRemaining = await calculateDaysRemainingUseCase();
      final deadlineEvent = await eventRepository.getDeadlineEvent();

      emit(
        CalendarState.loaded(
          focusedDay: now,
          selectedDay: now,
          calendarFormat: CalendarFormat.month,
          selectedEvents: events,
          daysRemaining: daysRemaining,
          deadlineEvent: deadlineEvent,
        ),
      );
    } catch (e) {
      emit(CalendarState.error(errorMessage: e.toString()));
    }
  }

  Future<void> _onCalculateDaysRemaining(
    CalculateDaysRemaining event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final calendarFormat, 
                 :final selectedEvents, :final deadlineEvent):
        try {
          final newDaysRemaining = await calculateDaysRemainingUseCase();
          
          emit(
            CalendarState.loaded(
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              calendarFormat: calendarFormat,
              selectedEvents: selectedEvents,
              daysRemaining: newDaysRemaining,
              deadlineEvent: deadlineEvent,
            ),
          );
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  Future<void> _onGetEvents(
    GetEvents event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final calendarFormat, 
                 :final daysRemaining, :final deadlineEvent):
        try {
          final newEvents = await getEventsForDayUseCase(selectedDay);
          
          emit(
            CalendarState.loaded(
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              calendarFormat: calendarFormat,
              selectedEvents: newEvents,
              daysRemaining: daysRemaining,
              deadlineEvent: deadlineEvent,
            ),
          );
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  Future<void> _onGetDeadlineDate(
    GetDeadlineDate event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final calendarFormat, 
                 :final selectedEvents, :final daysRemaining):
        try {
          final newDeadlineEvent = await eventRepository.getDeadlineEvent();
          
          emit(
            CalendarState.loaded(
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              calendarFormat: calendarFormat,
              selectedEvents: selectedEvents,
              daysRemaining: daysRemaining,
              deadlineEvent: newDeadlineEvent,
            ),
          );
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  Future<void> _onDaySelected(
    DaySelected event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final selectedDay, :final calendarFormat, :final daysRemaining, :final deadlineEvent):
        try {
          if (!_isSameDay(selectedDay, event.selectedDay)) {
            final newEvents = await getEventsForDayUseCase(event.selectedDay);
            
            emit(
              CalendarState.loaded(
                focusedDay: event.focusedDay,
                selectedDay: event.selectedDay,
                calendarFormat: calendarFormat,
                selectedEvents: newEvents,
                daysRemaining: daysRemaining,
                deadlineEvent: deadlineEvent,
              ),
            );
          }
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  void _onFormatChanged(
    FormatChanged event,
    Emitter<CalendarState> emit,
  ) {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final selectedEvents, 
                 :final daysRemaining, :final deadlineEvent):
        emit(
          CalendarState.loaded(
            focusedDay: focusedDay,
            selectedDay: selectedDay,
            calendarFormat: event.format ?? CalendarFormat.month,
            selectedEvents: selectedEvents,
            daysRemaining: daysRemaining,
            deadlineEvent: deadlineEvent,
          ),
        );
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  void _onPageChanged(
    PageChanged event,
    Emitter<CalendarState> emit,
  ) {
    switch (state) {
      case Loaded(:final selectedDay, :final calendarFormat, :final selectedEvents, 
                 :final daysRemaining, :final deadlineEvent):
        emit(
          CalendarState.loaded(
            focusedDay: event.focusedDay,
            selectedDay: selectedDay,
            calendarFormat: calendarFormat,
            selectedEvents: selectedEvents,
            daysRemaining: daysRemaining,
            deadlineEvent: deadlineEvent,
          ),
        );
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  Future<void> _onEventStatusChanged(
    EventStatusChanged event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final calendarFormat, 
                 :final daysRemaining, :final deadlineEvent):
        try {
          await updateEventStatusUseCase(event.eventId, event.newStatus);
          final updatedEvents = await getEventsForDayUseCase(selectedDay);
          
          emit(
            CalendarState.loaded(
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              calendarFormat: calendarFormat,
              selectedEvents: updatedEvents,
              daysRemaining: daysRemaining,
              deadlineEvent: deadlineEvent,
            ),
          );
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  Future<void> _onEventAdded(
    EventAdded event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final calendarFormat, 
                 :final daysRemaining, :final deadlineEvent):
        try {
          await eventRepository.addEvent(event.event);
          final updatedEvents = await getEventsForDayUseCase(selectedDay);
          
          emit(
            CalendarState.loaded(
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              calendarFormat: calendarFormat,
              selectedEvents: updatedEvents,
              daysRemaining: daysRemaining,
              deadlineEvent: deadlineEvent,
            ),
          );
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  Future<void> _onEventDeleted(
    EventDeleted event,
    Emitter<CalendarState> emit,
  ) async {
    switch (state) {
      case Loaded(:final focusedDay, :final selectedDay, :final calendarFormat, 
                 :final daysRemaining, :final deadlineEvent):
        try {
          await eventRepository.deleteEvent(event.eventId);
          final updatedEvents = await getEventsForDayUseCase(selectedDay);
          
          emit(
            CalendarState.loaded(
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              calendarFormat: calendarFormat,
              selectedEvents: updatedEvents,
              daysRemaining: daysRemaining,
              deadlineEvent: deadlineEvent,
            ),
          );
        } catch (e) {
          emit(CalendarState.error(errorMessage: e.toString()));
        }
      case Initial() || Loading() || Error():
        // No hacer nada si no estamos en estado loaded
        break;
    }
  }

  bool _isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}