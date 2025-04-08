import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/examen_entity.dart';
import '../widgets/grafico_resultado_widget.dart';
import '../widgets/lista_respuestas_widget.dart';

/// Pantalla de resultados del examen finalizado.
class ResultadosScreen extends StatelessWidget {
  final ExamenEntity examen;
  final int puntajeObtenido;
  final int totalPreguntas;
  final int preguntasRespondidas;
  final int respuestasCorrectas;

  const ResultadosScreen({
    Key? key,
    required this.examen,
    required this.puntajeObtenido,
    required this.totalPreguntas,
    required this.preguntasRespondidas,
    required this.respuestasCorrectas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculamos el porcentaje de aprobación y lo usamos para determinar si aprobó
    final porcentaje = (puntajeObtenido / examen.puntajeTotal) * 100;
    final aprobado = porcentaje >= 60; // Consideramos 60% como aprobado

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
          color: const Color(0xFF0A5F38), // Verde pizarrón
          border: Border.all(
            color: const Color(0xFF8B4513), // Marrón "madera"
            width: 8.0,
          ),
        ),
        margin: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con el resultado
              _EncabezadoResultado(
                aprobado: aprobado,
                porcentaje: porcentaje,
                puntajeObtenido: puntajeObtenido,
                puntajeTotal: examen.puntajeTotal,
              ),

              const SizedBox(height: 32),

              // Estadísticas generales
              _EstadisticasResultados(
                totalPreguntas: totalPreguntas,
                preguntasRespondidas: preguntasRespondidas,
                respuestasCorrectas: respuestasCorrectas,
              ),

              const SizedBox(height: 32),

              // Gráfico de resultados
              GraficoResultadoWidget(
                respuestasCorrectas: respuestasCorrectas,
                respuestasIncorrectas:
                    preguntasRespondidas - respuestasCorrectas,
                preguntasSinResponder: totalPreguntas - preguntasRespondidas,
              ),

              const SizedBox(height: 32),

              // Lista de respuestas
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
                respuestas: examen.preguntas.fold<Map<String, String>>({}, (
                  map,
                  pregunta,
                ) {
                  if (pregunta.respuestaSeleccionada != null) {
                    map[pregunta.id] = pregunta.respuestaSeleccionada!;
                  }
                  return map;
                }),
              ),

              const SizedBox(height: 32),

              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
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
