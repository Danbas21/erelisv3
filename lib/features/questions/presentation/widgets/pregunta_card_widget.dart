import 'package:flutter/material.dart';
import '../../domain/entities/pregunta_entity.dart';

/// Widget que muestra una tarjeta con la pregunta.
class PreguntaCardWidget extends StatelessWidget {
  final PreguntaEntity pregunta;
  final int numeroPregunta;

  const PreguntaCardWidget({
    super.key,
    required this.pregunta,
    required this.numeroPregunta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Número y tipo de pregunta
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Pregunta $numeroPregunta',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: _getColorPorTipo(pregunta.tipo),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  _getTipoTexto(pregunta.tipo),
                  style: const TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
              const Spacer(),
              Text(
                '${pregunta.puntos} ${pregunta.puntos == 1 ? 'punto' : 'puntos'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // Texto de la pregunta
          Text(
            pregunta.texto,
            style: const TextStyle(
              fontFamily: 'Chalkboard', // Tipografía tipo gis
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black38,
                  offset: Offset(0.5, 0.5),
                  blurRadius: 2.0,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Devuelve el texto para mostrar según el tipo de pregunta.
  String _getTipoTexto(String tipo) {
    switch (tipo) {
      case 'multiple-choice':
        return 'Opción múltiple';
      case 'true-false':
        return 'Verdadero/Falso';
      case 'short-answer':
        return 'Respuesta corta';
      default:
        return tipo;
    }
  }

  /// Devuelve un color según el tipo de pregunta.
  Color _getColorPorTipo(String tipo) {
    switch (tipo) {
      case 'multiple-choice':
        return const Color(0xFFF59E0B); // Naranja
      case 'true-false':
        return const Color(0xFF22C55E); // Verde
      case 'short-answer':
        return const Color(0xFFEF4444); // Rojo
      default:
        return Colors.grey;
    }
  }
}
