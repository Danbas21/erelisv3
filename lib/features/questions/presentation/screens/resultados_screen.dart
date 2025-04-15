import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:erelis/features/questions/presentation/widgets/grafico_resultado_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/lista_respuestas_widget.dart';
import 'package:erelis/features/unidad/presentation/pages/unit_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import '../../domain/entities/examen_entity.dart';

/// Pantalla de resultados del examen finalizado.
class ResultadosScreen extends StatelessWidget {
  final ExamenEntity examen;
  final int puntajeObtenido;
  final int totalPreguntas;
  final int preguntasRespondidas;
  final int respuestasCorrectas;
  final Map<String, String> respuestasSeleccionadas; // NUEVO

  const ResultadosScreen({
    super.key,
    required this.examen,
    required this.puntajeObtenido,
    required this.totalPreguntas,
    required this.preguntasRespondidas,
    required this.respuestasCorrectas,
    required this.respuestasSeleccionadas, // NUEVO
  });

  @override
  Widget build(BuildContext context) {
    final porcentaje = (puntajeObtenido / examen.puntajeTotal) * 100;
    final aprobado = porcentaje >= 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados del Examen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Compartir resultados',
            onPressed: () => _compartirResultados(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A5F38),
          border: Border.all(color: const Color(0xFF8B4513), width: 8.0),
        ),
        margin: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _EncabezadoResultado(
                aprobado: aprobado,
                porcentaje: porcentaje,
                puntajeObtenido: puntajeObtenido,
                puntajeTotal: examen.puntajeTotal,
              ),
              const SizedBox(height: 32),
              _EstadisticasResultados(
                totalPreguntas: totalPreguntas,
                preguntasRespondidas: preguntasRespondidas,
                respuestasCorrectas: respuestasCorrectas,
              ),
              const SizedBox(height: 32),
              GraficoResultadoWidget(
                respuestasCorrectas: respuestasCorrectas,
                respuestasIncorrectas:
                    preguntasRespondidas - respuestasCorrectas,
                preguntasSinResponder: totalPreguntas - preguntasRespondidas,
              ),
              const SizedBox(height: 32),
              const Text(
                'Detalle de respuestas:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListaRespuestasWidget(
                preguntas: examen.preguntas,
                respuestas: respuestasSeleccionadas, // CAMBIO AQUÍ
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed:
                        () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => TestProviders(
                                  child: UnitDetailPage(
                                    unitId: examen.id.split('-')[0],
                                    cursoid: examen.id.split('-')[1],
                                  ),
                                ),
                          ),
                        ),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('VOLVER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () => _compartirResultados(context),
                    icon: const Icon(Icons.share),
                    label: const Text('COMPARTIR'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _compartirResultados(BuildContext context) {
    final porcentaje = (puntajeObtenido / examen.puntajeTotal) * 100;
    final aprobado = porcentaje >= 60;

    final mensaje =
        '¡He completado el examen "${examen.titulo}"!\n\n'
        'Resultado: ${aprobado ? "APROBADO ✅" : "REPROBADO ❌"}\n'
        'Puntaje: $puntajeObtenido/${examen.puntajeTotal} puntos\n'
        'Porcentaje: ${porcentaje.toStringAsFixed(1)}%\n'
        'Respuestas correctas: $respuestasCorrectas de $preguntasRespondidas\n\n'
        'Compartido desde la app Erelis';

    Share.share(mensaje);
  }
}

class _EncabezadoResultado extends StatelessWidget {
  final bool aprobado;
  final double porcentaje;
  final int puntajeObtenido;
  final int puntajeTotal;

  const _EncabezadoResultado({
    required this.aprobado,
    required this.porcentaje,
    required this.puntajeObtenido,
    required this.puntajeTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Título del resultado
        Text(
          aprobado ? '¡APROBADO!' : 'REPROBADO',
          style: TextStyle(
            fontFamily: 'Chalkboard', // Tipografía tipo gis
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: aprobado ? Colors.green.shade300 : Colors.red.shade300,
            shadows: [
              Shadow(
                color: aprobado ? Colors.green.shade900 : Colors.red.shade900,
                offset: const Offset(1, 1),
                blurRadius: 3.0,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        // Círculo con el porcentaje
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                aprobado
                    ? Colors.green.shade800.withValues(alpha: 0.3)
                    : Colors.red.shade800.withValues(alpha: 0.3),
            border: Border.all(
              color: aprobado ? Colors.green.shade300 : Colors.red.shade300,
              width: 4.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${porcentaje.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$puntajeObtenido/$puntajeTotal pts',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EstadisticasResultados extends StatelessWidget {
  final int totalPreguntas;
  final int preguntasRespondidas;
  final int respuestasCorrectas;

  const _EstadisticasResultados({
    required this.totalPreguntas,
    required this.preguntasRespondidas,
    required this.respuestasCorrectas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _FilaEstadistica(
            icono: Icons.help_outline,
            texto: 'Total de preguntas',
            valor: '$totalPreguntas',
          ),
          const Divider(color: Colors.white30),
          _FilaEstadistica(
            icono: Icons.check_circle_outline,
            texto: 'Preguntas respondidas',
            valor: '$preguntasRespondidas',
            porcentaje: preguntasRespondidas / totalPreguntas * 100,
          ),
          const Divider(color: Colors.white30),
          _FilaEstadistica(
            icono: Icons.done_all,
            texto: 'Respuestas correctas',
            valor: '$respuestasCorrectas',
            porcentaje: respuestasCorrectas / preguntasRespondidas * 100,
          ),
          const Divider(color: Colors.white30),
          _FilaEstadistica(
            icono: Icons.cancel_outlined,
            texto: 'Respuestas incorrectas',
            valor: '${preguntasRespondidas - respuestasCorrectas}',
            porcentaje:
                (preguntasRespondidas - respuestasCorrectas) /
                preguntasRespondidas *
                100,
          ),
        ],
      ),
    );
  }
}

class _FilaEstadistica extends StatelessWidget {
  final IconData icono;
  final String texto;
  final String valor;
  final double? porcentaje;

  const _FilaEstadistica({
    required this.icono,
    required this.texto,
    required this.valor,
    this.porcentaje,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icono, color: Colors.white70, size: 20),
          const SizedBox(width: 8),
          Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Spacer(),
          Text(
            valor,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (porcentaje != null) ...[
            const SizedBox(width: 8),
            Text(
              '(${porcentaje!.toStringAsFixed(1)}%)',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}
