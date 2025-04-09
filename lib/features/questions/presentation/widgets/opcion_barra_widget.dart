import 'package:flutter/material.dart';

/// Widget que muestra una opción de respuesta para una pregunta.
class OpcionPreguntaWidget extends StatelessWidget {
  final String texto;
  final bool seleccionada;
  final VoidCallback onTap;

  const OpcionPreguntaWidget({
    super.key,
    required this.texto,
    required this.seleccionada,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      splashColor: const Color(0xFF3B82F6).withValues(alpha: 0.3),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color:
              seleccionada
                  ? const Color(0xFF3B82F6).withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color:
                seleccionada
                    ? const Color(0xFF3B82F6)
                    : Colors.white.withValues(alpha: 0.3),
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            // Icono de selección
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    seleccionada ? const Color(0xFF3B82F6) : Colors.transparent,
                border: Border.all(
                  color:
                      seleccionada
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.6),
                  width: 2.0,
                ),
              ),
              child:
                  seleccionada
                      ? const Icon(Icons.check, color: Colors.white, size: 16.0)
                      : null,
            ),
            const SizedBox(width: 16.0),

            // Texto de la opción
            Expanded(
              child: Text(
                texto,
                style: TextStyle(
                  fontFamily: 'Chalkboard', // Tipografía tipo gis
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight:
                      seleccionada ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
