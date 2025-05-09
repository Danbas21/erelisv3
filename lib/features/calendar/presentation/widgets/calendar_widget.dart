import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/calendar/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime deadlineDate;
  
  const CalendarWidget({
    Key? key,
    required this.deadlineDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return switch (state) {
          Initial() || Loading() => _buildLoadingCalendar(context),
          Loaded(:final focusedDay, :final selectedDay, :final calendarFormat) => 
              _buildLoadedCalendar(
                context, 
                focusedDay, 
                selectedDay, 
                calendarFormat,
                state, // Pasar el estado completo para el eventLoader
              ),
          Error() => _buildErrorCalendar(context),
        };
      },
    );
  }

  Widget _buildLoadingCalendar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryLightBlue,
        ),
      ),
    );
  }

  Widget _buildErrorCalendar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.error,
              size: 48,
            ),
            SizedBox(height: 16),
            Text(
              'Error al cargar el calendario',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedCalendar(
    BuildContext context,
    DateTime focusedDay,
    DateTime selectedDay,
    CalendarFormat calendarFormat,
    Loaded loadedState,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TableCalendar<EventCalendar>(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        calendarFormat: calendarFormat,
        eventLoader: (day) {
          // Esta función debe ser optimizada en una implementación real
          return context.read<CalendarBloc>().getEventsForDayUseCase(day);
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        
        // Configuración para español
        locale: 'es_ES',
        
        // Personalización de la apariencia
        headerStyle: HeaderStyle(
          formatButtonVisible: true,
          titleCentered: true,
          formatButtonShowsNext: false,
          titleTextStyle: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: const Icon(
            Icons.chevron_left,
            color: AppColors.primaryLightBlue,
          ),
          rightChevronIcon: const Icon(
            Icons.chevron_right,
            color: AppColors.primaryLightBlue,
          ),
          formatButtonDecoration: BoxDecoration(
            color: AppColors.primaryLightBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          formatButtonTextStyle: const TextStyle(
            color: AppColors.primaryLightBlue,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryDarkBlue,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        ),
        calendarStyle: CalendarStyle(
          // Estilo para los marcadores de eventos
          markerDecoration: const BoxDecoration(
            color: AppColors.primaryOrange,
            shape: BoxShape.circle,
          ),
          // Estilo para el día seleccionado
          selectedDecoration: BoxDecoration(
            color: AppColors.primaryLightBlue,
            shape: BoxShape.circle,
          ),
          // Estilo para el día actual
          todayDecoration: BoxDecoration(
            color: AppColors.primaryOrange.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          // Colores de texto
          defaultTextStyle: const TextStyle(color: AppColors.textPrimary),
          weekendTextStyle: const TextStyle(color: AppColors.textSecondary),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          todayTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          // Estilo para el día del examen
          markersMaxCount: 3,
          markersAnchor: 0.7,
          outsideDaysVisible: false,
        ),
        
        // Estilo para los días de la semana
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: AppColors.textSecondary, 
            fontWeight: FontWeight.bold,
          ),
          weekendStyle: TextStyle(
            color: AppColors.primaryOrange, 
            fontWeight: FontWeight.bold,
          ),
        ),
        
        // Eventos al seleccionar día o cambiar formato
        onDaySelected: (selectedDay, focusedDay) {
          context.read<CalendarBloc>().add(
                CalendarEvent.dateSelected(selectedDay, focusedDay),
              );
        },
        onFormatChanged: (format) {
          context.read<CalendarBloc>().add(
                CalendarEvent.formatChanged(format: format),
              );
        },
        onPageChanged: (focusedDay) {
          context.read<CalendarBloc>().add(
                CalendarEvent.pageChanged(focusedDay),
              );
        },
        
        // Personalizar los builders para estilos especiales
        calendarBuilders: CalendarBuilders(
          // Marcador de eventos personalizado
          markerBuilder: (context, date, events) {
            if (events.isEmpty) return null;
            
            // Verificar si este día tiene el evento de deadline
            final hasDeadline = events.any((e) => e.isDeadline);
            
            return Positioned(
              bottom: 1,
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasDeadline 
                      ? AppColors.error 
                      : AppColors.primaryOrange,
                ),
              ),
            );
          },
          
          // Estilo personalizado para el día seleccionado
          selectedBuilder: (context, date, _) {
            final isDeadlineDay = isSameDay(date, deadlineDate);
            
            return Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDeadlineDay
                    ? AppColors.error
                    : AppColors.primaryLightBlue,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${date.day}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          
          // Estilo personalizado para el día actual
          todayBuilder: (context, date, _) {
            if (!isSameDay(date, selectedDay)) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${date.day}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return null;
          },
          
          // Personalizar el encabezado del día
          dowBuilder: (context, day) {
            final locale = Localizations.localeOf(context).languageCode;
            final dowText = DateFormat.E(locale).format(day).substring(0, 3).toUpperCase();
            
            final isWeekend = day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
            
            return Center(
              child: Text(
                dowText,
                style: TextStyle(
                  color: isWeekend ? AppColors.primaryOrange : AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}