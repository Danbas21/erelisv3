import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/calendar/domain/entities/event.dart';
import 'dart:collection';

class LocalEventDataSource {
  // Simulando un almacenamiento local en memoria
  final LinkedHashMap<DateTime, List<EventCalendar>> _events =
      LinkedHashMap<DateTime, List<EventCalendar>>(
        equals: _isSameDay,
        hashCode:
            (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
      );

  // Fecha de examen (deadline)
  final DateTime _deadlineDate = DateTime(2025, 7, 15);

  LocalEventDataSource() {
    // Inicializar con algunos eventos de ejemplo
    _initializeEvents();
  }

  void _initializeEvents() {
    // Evento de deadline
    _events[_deadlineDate] = [
      EventCalendar(
        id: '',
        title: 'EXAMEN ADMINISTRATIVO',
        description: 'Fecha límite para el examen administrativo',
        startDate: _deadlineDate,
        color: AppColors.error,
        isDeadLine: true,
        status: 'pendiente',
      ),
    ];

    // Eventos para planificación
    final today = DateTime.now();

    // Evento para hoy
    _events[today] = [
      EventCalendar(
        id: 'today-1',
        title: 'Sesión de estudio',
        description: 'Repasar unidades 1-3 del temario',
        startDate: today,
        color: AppColors.primaryGreen,
        isDeadLine: false,
        status: 'pendiente',
      ),
    ];

    // Eventos para los próximos días
    final tomorrow = DateTime(today.year, today.month, today.day + 1);
    _events[tomorrow] = [
      EventCalendar(
        id: 'tomorrow-1',
        title: 'Práctica de ejercicios',
        description: 'Resolver problemas tipo del examen',
        startDate: tomorrow,
        color: AppColors.primaryOrange,
        isDeadLine: false,
        status: 'pendiente',
      ),
    ];

    // Evento para dentro de 3 días
    final day3 = DateTime(today.year, today.month, today.day + 3);
    _events[day3] = [
      EventCalendar(
        id: 'day3-1',
        title: 'Simulacro de examen',
        description: 'Realizar prueba cronometrada',
        startDate: day3,
        color: AppColors.primaryLightBlue,
        isDeadLine: false,
        status: 'pendiente',
      ),
      EventCalendar(
        id: 'day3-2',
        title: 'Revisión con tutor',
        description: 'Revisar dudas pendientes',
        startDate: day3,
        color: AppColors.secondaryTeal,
        isDeadLine: false,
        status: 'pendiente',
      ),
    ];

    // Evento para la semana próxima (completado)
    final nextWeek = DateTime(today.year, today.month, today.day + 7);
    _events[nextWeek] = [
      EventCalendar(
        id: 'week-1',
        title: 'Examen de prueba',
        description: 'Examen de prueba con otros estudiantes',
        startDate: nextWeek,
        color: AppColors.secondaryTeal,
        status: 'completado',
        isDeadLine: false,
      ),
    ];
  }

  List<EventCalendar> getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  List<EventCalendar> getAllEvents() {
    final List<EventCalendar> allEvents = [];
    _events.forEach((key, value) {
      allEvents.addAll(value);
    });
    return allEvents;
  }

  void addEvent(EventCalendar event) {
    final day = DateTime(
      event.startDate.year,
      event.startDate.month,
      event.startDate.day,
    );
    if (_events[day] != null) {
      _events[day]!.add(event);
    } else {
      _events[day] = [event];
    }
  }

  void deleteEvent(String id) {
    _events.forEach((key, value) {
      value.removeWhere((event) => event.id == id);
    });
  }

  void updateEvent(EventCalendar event) {
    // Primero eliminar el evento anterior
    deleteEvent(event.id);

    // Luego agregar el evento actualizado
    addEvent(event);
  }

  DateTime getDeadlineDate() {
    return _deadlineDate;
  }

  EventCalendar? getDeadlineEvent() {
    final deadlineEvents = _events[_deadlineDate];
    if (deadlineEvents != null && deadlineEvents.isNotEmpty) {
      return deadlineEvents.firstWhere(
        (event) => event.isDeadLine,
        orElse: () => deadlineEvents.first,
      );
    }
    return null;
  }

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
