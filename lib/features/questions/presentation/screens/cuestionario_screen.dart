// cuestionario_screen.dart
import 'package:erelis/features/questions/presentation/blocs/examen/examen_bloc.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';

import 'package:erelis/features/questions/presentation/screens/resultados_screen.dart';
import 'package:erelis/features/questions/presentation/widgets/opcion_barra_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/pregunta_card_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/progreso_barra_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/temporizador_widget.dart';
import 'package:erelis/features/unidad/presentation/pages/unit_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/pregunta_entity.dart';
import '../blocs/progreso/progreso_bloc.dart';

class CuestionarioScreen extends StatelessWidget {
  final String examenId;
  final String usuarioId;

  const CuestionarioScreen({
    super.key,
    required this.examenId,
    required this.usuarioId,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ExamenBloc>().add(
      ExamenEvent.iniciado(examenId: examenId, usuarioId: usuarioId),
    );

    return BlocListener<ExamenBloc, ExamenState>(
      listener: (context, state) {
        switch (state) {
          case Finalizado():
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (_) => TestProviders(
                      child: ResultadosScreen(
                        examen: state.examen,
                        puntajeObtenido: state.puntajeObtenido,
                        totalPreguntas: state.totalPreguntas,
                        preguntasRespondidas: state.preguntasRespondidas,
                        respuestasCorrectas: state.respuestasCorrectas,
                        respuestasSeleccionadas: state.respuestas, // NUEVO
                      ),
                    ),
              ),
            );
            break;
          case Error(:final mensaje):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(mensaje), backgroundColor: Colors.red),
            );
            break;
          default:
            break;
        }
      },
      child: BlocBuilder<ExamenBloc, ExamenState>(
        builder: (context, state) {
          switch (state) {
            case InicialExamen():
            case Cargando():
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            case Error(:final mensaje):
              return Scaffold(body: Center(child: Text(mensaje)));
            case EnCurso(
              :final preguntaActual,
              :final indicePreguntaActual,
              :final respuestas,
              :final examen,
            ):
              _iniciarProgreso(context, state);
              final totalPreguntas = examen.preguntas.length;
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Pregunta ${indicePreguntaActual + 1} de $totalPreguntas',
                  ),
                  actions: [
                    BlocBuilder<ProgresoBloc, ProgresoState>(
                      builder:
                          (context, progresoState) =>
                              progresoState is EnCursoP
                                  ? TemporizadorWidget(
                                    segundos: progresoState.tiempoRestantes,
                                  )
                                  : const SizedBox.shrink(),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    BlocBuilder<ProgresoBloc, ProgresoState>(
                      builder:
                          (context, progresoState) =>
                              progresoState is EnCursoP
                                  ? ProgresoBarraWidget(
                                    total: progresoState.totalPreguntas,
                                    completadas:
                                        progresoState.preguntasRespondidas,
                                    indicePreguntaActual: indicePreguntaActual,
                                  )
                                  : const SizedBox.shrink(),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xFF0A5F38),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PreguntaCardWidget(
                                pregunta: preguntaActual,
                                numeroPregunta: indicePreguntaActual + 1,
                              ),
                              const SizedBox(height: 24),
                              if (preguntaActual.tipo == 'multiple-choice')
                                ..._buildOpciones(
                                  context,
                                  preguntaActual,
                                  respuestas[preguntaActual.id],
                                  usuarioId,
                                  indicePreguntaActual,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _BarraNavegacion(
                      indiceActual: indicePreguntaActual,
                      totalPreguntas: totalPreguntas,
                      usuarioId: usuarioId,
                      examenId: examenId,
                    ),
                  ],
                ),
              );
            default:
              return const Scaffold(
                body: Center(child: Text('Estado no manejado')),
              );
          }
        },
      ),
    );
  }

  void _iniciarProgreso(BuildContext context, EnCurso state) {
    final progresoState = context.read<ProgresoBloc>().state;
    if (progresoState is Inicial) {
      context.read<ProgresoBloc>().add(
        ProgresoEvent.iniciado(
          examenId: examenId,
          usuarioId: usuarioId,
          totalPreguntas: state.examen.preguntas.length,
          respuestas: state.respuestas,
          tiempoTotalSegundos: state.tiempoRestante,
        ),
      );
    }
  }

  List<Widget> _buildOpciones(
    BuildContext context,
    PreguntaEntity pregunta,
    String? seleccionada,
    String usuarioId,
    int indiceActual,
  ) {
    return pregunta.opciones.map((opcion) {
      final estaSeleccionada = seleccionada == opcion.texto;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: OpcionPreguntaWidget(
          texto: opcion.texto,
          seleccionada: estaSeleccionada,
          onTap: () {
            context.read<ExamenBloc>().add(
              ExamenEvent.respuestaSeleccionada(
                preguntaId: pregunta.id,
                respuesta: opcion.texto,
                usuarioId: usuarioId,
              ),
            );
            context.read<ProgresoBloc>().add(
              PreguntaRespondida(
                preguntaId: pregunta.id,
                respuesta: opcion.texto,
                indicePreguntaActual: indiceActual,
              ),
            );
          },
        ),
      );
    }).toList();
  }
}

class _BarraNavegacion extends StatelessWidget {
  final int indiceActual;
  final int totalPreguntas;
  final String usuarioId;
  final String examenId; // Cambia esto por el ID real del examen

  const _BarraNavegacion({
    required this.indiceActual,
    required this.totalPreguntas,
    required this.usuarioId,
    required this.examenId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF172A52),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed:
                indiceActual > 0
                    ? () => context.read<ExamenBloc>().add(
                      ExamenEvent.preguntaCambiada(
                        nuevaIndice: indiceActual - 1,
                      ),
                    )
                    : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Anterior'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text('Finalizar examen'),
                      content: const Text(
                        '¿Estás seguro de que deseas finalizar el examen? No podrás volver a editarlo.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('CANCELAR'),
                        ),
                        //aqui deseo si el usuario presiona finalizar valida si esta completo el examen, envia a la pagina de resultados de los contrario
                        // guarda el progeso y regresa a la pagina de unidades
                        ElevatedButton(
                          onPressed: () {
                            if (indiceActual == totalPreguntas - 1) {
                              context.read<ExamenBloc>().add(
                                ExamenEvent.finalizado(usuarioId: usuarioId),
                              );
                            } else {
                              context.read<ExamenBloc>().add(
                                ExamenEvent.progresoGuardado(
                                  examenId: examenId,
                                  usuarioId: usuarioId,
                                ),
                              );
                              //regresa a units details
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => TestProviders(
                                        child: UnitDetailPage(
                                          unitId: examenId.split('_')[1],
                                          cursoid: examenId.split('_')[0],
                                        ),
                                      ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child:
                              indiceActual == totalPreguntas - 1
                                  ? const Text('Calificar')
                                  : const Text('Guardar progreso y salir'),
                        ),
                      ],
                    ),
              );
            },
            icon: const Icon(Icons.done_all),
            label:
                indiceActual == totalPreguntas - 1
                    ? const Text('Calificar')
                    : const Text('Guardar progreso y salir'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
          ElevatedButton.icon(
            onPressed:
                indiceActual < totalPreguntas - 1
                    ? () => context.read<ExamenBloc>().add(
                      ExamenEvent.preguntaCambiada(
                        nuevaIndice: indiceActual + 1,
                      ),
                    )
                    : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Siguiente'),
          ),
        ],
      ),
    );
  }
}
