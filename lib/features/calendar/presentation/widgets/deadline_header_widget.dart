import 'package:erelis/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/event.dart';

class DeadlineHeaderWidget extends StatelessWidget {
  final int daysRemaining;
  final EventCalendar? deadlineEvent;

  const DeadlineHeaderWidget({
    super.key,
    required this.daysRemaining,
    this.deadlineEvent,
  });

  @override
  Widget build(BuildContext context) {
    final examTitle = deadlineEvent?.title ?? 'examen administrativo';
    
    // Determinar color basado en días restantes
    final Color primaryColor = daysRemaining <= 7 
        ? AppColors.error 
        : (daysRemaining <= 14 ? AppColors.warning : AppColors.info);
    
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Sección superior con días restantes
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(
                  daysRemaining <= 7 
                      ? Icons.warning_rounded 
                      : (daysRemaining <= 14 
                          ? Icons.access_time 
                          : Icons.calendar_today),
                  color: primaryColor,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$daysRemaining días restantes',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'para el $examTitle',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Barra de progreso
          if (daysRemaining <= 30)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildProgressBar(daysRemaining),
            ),
          
          // Sección de conteo regresivo numérico
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCountdownItem(context, (daysRemaining / 7).floor(), 'Semanas'),
                _buildCountdownDivider(),
                _buildCountdownItem(context, daysRemaining, 'Días'),
                _buildCountdownDivider(),
                _buildCountdownItem(context, daysRemaining * 24, 'Horas'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(int daysRemaining) {
    // Asumimos 30 días como preparación total
    final totalDays = 30;
    final double progress = (totalDays - daysRemaining) / totalDays;
    final progressPercent = (progress * 100).toInt();
    
    // Color basado en el progreso
    final Color progressColor = daysRemaining <= 7 
        ? AppColors.error 
        : (daysRemaining <= 14 ? AppColors.warning : AppColors.primaryLightBlue);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progreso de preparación',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
              Text(
                '$progressPercent%',
                style: TextStyle(
                  color: progressColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppColors.divider,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
        ),
      ],
    );
  }

  Widget _buildCountdownItem(BuildContext context, int value, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryDarkBlue,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          alignment: Alignment.center,
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCountdownDivider() {
    return const Text(
      ':',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryLightBlue,
      ),
    );
  }
}