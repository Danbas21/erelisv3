import 'package:flutter/material.dart';

/// Widget que muestra un temporizador para el examen.
class TemporizadorWidget extends StatelessWidget {
  final int segundos;

  const TemporizadorWidget({super.key, required this.segundos});

  @override
  Widget build(BuildContext context) {
    // Convertimos segundos a formato hh:mm:ss
    final horas = segundos ~/ 3600;
    final minutos = (segundos % 3600) ~/ 60;
    final segs = segundos % 60;

    // Formateamos para mostrar siempre dos dígitos
    final horasStr = horas.toString().padLeft(2, '0');
    final minutosStr = minutos.toString().padLeft(2, '0');
    final segsStr = segs.toString().padLeft(2, '0');

    // Determinamos el color según el tiempo restante
    final Color color = _getColorPorTiempo(segundos);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, color: color, size: 16.0),
          const SizedBox(width: 4.0),
          Text(
            horas > 0
                ? '$horasStr:$minutosStr:$segsStr'
                : '$minutosStr:$segsStr',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  /// Devuelve un color según el tiempo restante.
  Color _getColorPorTiempo(int segundos) {
    if (segundos <= 60) {
      // Menos de 1 minuto: rojo
      return Colors.red;
    } else if (segundos <= 300) {
      // Menos de 5 minutos: naranja
      return const Color(0xFFF59E0B);
    } else {
      // Más de 5 minutos: verde
      return const Color(0xFF22C55E);
    }
  }
}
