import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Widget que muestra un gráfico circular con los resultados del examen.
class GraficoResultadoWidget extends StatelessWidget {
  final int respuestasCorrectas;
  final int respuestasIncorrectas;
  final int preguntasSinResponder;

  const GraficoResultadoWidget({
    super.key,
    required this.respuestasCorrectas,
    required this.respuestasIncorrectas,
    required this.preguntasSinResponder,
  });

  @override
  Widget build(BuildContext context) {
    final total =
        respuestasCorrectas + respuestasIncorrectas + preguntasSinResponder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Resumen de respuestas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        // Gráfico circular
        SizedBox(
          height: 180,
          width: 180,
          child: CustomPaint(
            painter: _GraficoPainter(
              respuestasCorrectas: respuestasCorrectas,
              respuestasIncorrectas: respuestasIncorrectas,
              preguntasSinResponder: preguntasSinResponder,
              total: total,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Leyenda
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ItemLeyenda(
              color: const Color(0xFF22C55E),
              texto: 'Correctas',
              cantidad: respuestasCorrectas,
              porcentaje: total > 0 ? (respuestasCorrectas / total * 100) : 0,
            ),
            _ItemLeyenda(
              color: const Color(0xFFEF4444),
              texto: 'Incorrectas',
              cantidad: respuestasIncorrectas,
              porcentaje: total > 0 ? (respuestasIncorrectas / total * 100) : 0,
            ),
            _ItemLeyenda(
              color: Colors.grey,
              texto: 'Sin responder',
              cantidad: preguntasSinResponder,
              porcentaje: total > 0 ? (preguntasSinResponder / total * 100) : 0,
            ),
          ],
        ),
      ],
    );
  }
}

/// Clase para pintar el gráfico circular de resultados.
class _GraficoPainter extends CustomPainter {
  final int respuestasCorrectas;
  final int respuestasIncorrectas;
  final int preguntasSinResponder;
  final int total;

  _GraficoPainter({
    required this.respuestasCorrectas,
    required this.respuestasIncorrectas,
    required this.preguntasSinResponder,
    required this.total,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Si no hay preguntas, dibujamos un círculo gris
    if (total == 0) {
      final paint =
          Paint()
            ..color = Colors.grey
            ..style = PaintingStyle.stroke
            ..strokeWidth = 30.0;

      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 - 15,
        paint,
      );
      return;
    }

    final double radioExterno = size.width / 2;
    final double radioInterno = radioExterno - 30;
    final Offset centro = Offset(size.width / 2, size.height / 2);

    // Dibujamos el fondo
    final paintFondo =
        Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 30.0;

    canvas.drawCircle(centro, radioInterno, paintFondo);

    // Ángulos iniciales
    double startAngle = -math.pi / 2; // Comenzamos desde arriba (90 grados)

    // Dibujamos la sección de respuestas correctas (verde)
    if (respuestasCorrectas > 0) {
      final double sweepAngleCorrectas =
          2 * math.pi * respuestasCorrectas / total;
      final paintCorrectas =
          Paint()
            ..color = const Color(0xFF22C55E)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 30.0
            ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: centro, radius: radioInterno),
        startAngle,
        sweepAngleCorrectas,
        false,
        paintCorrectas,
      );

      startAngle += sweepAngleCorrectas;
    }

    // Dibujamos la sección de respuestas incorrectas (rojo)
    if (respuestasIncorrectas > 0) {
      final double sweepAngleIncorrectas =
          2 * math.pi * respuestasIncorrectas / total;
      final paintIncorrectas =
          Paint()
            ..color = const Color(0xFFEF4444)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 30.0
            ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: centro, radius: radioInterno),
        startAngle,
        sweepAngleIncorrectas,
        false,
        paintIncorrectas,
      );

      startAngle += sweepAngleIncorrectas;
    }

    // Dibujamos la sección de preguntas sin responder (gris)
    if (preguntasSinResponder > 0) {
      final double sweepAngleSinResponder =
          2 * math.pi * preguntasSinResponder / total;
      final paintSinResponder =
          Paint()
            ..color = Colors.grey
            ..style = PaintingStyle.stroke
            ..strokeWidth = 30.0
            ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: centro, radius: radioInterno),
        startAngle,
        sweepAngleSinResponder,
        false,
        paintSinResponder,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Widget para mostrar un ítem de la leyenda del gráfico.
class _ItemLeyenda extends StatelessWidget {
  final Color color;
  final String texto;
  final int cantidad;
  final double porcentaje;

  const _ItemLeyenda({
    required this.color,
    required this.texto,
    required this.cantidad,
    required this.porcentaje,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              '$cantidad (${porcentaje.toStringAsFixed(1)}%)',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
