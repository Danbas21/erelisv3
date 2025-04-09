import 'package:erelis/features/questions/presentation/blocs/examen/examen_bloc.dart';
import 'package:erelis/features/questions/presentation/screens/resultados_screen.dart';
import 'package:erelis/features/questions/presentation/widgets/opcion_barra_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/pregunta_card_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/progreso_barra_widget.dart';
import 'package:erelis/features/questions/presentation/widgets/temporizador_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pregunta_entity.dart';

import '../blocs/progreso/progreso_bloc.dart';

/// Pantalla principal del cuestionario de examen.
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
    return MultiBlocListener(
      listeners: [
        BlocListener<ExamenBloc, ExamenState>(
          listener: (context, state) {
            if (state is Finalizado) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder:
                      (_) => ResultadosScreen(
                        examen: state.examen,
                        puntajeObtenido: state.puntajeObtenido,
                        totalPreguntas: state.totalPreguntas,
                        preguntasRespondidas: state.preguntasRespondidas,
                        respuestasCorrectas: state.respuestasCorrectas,
                      ),
                ),
              );
            }
          },
        ),
        BlocListener<ProgresoBloc, ProgresoState>(
          listener: (context, state) {
            if (state is TiempoAgotado) {
              // Cuando se agota el tiempo, finalizamos el examen
              context.read<ExamenBloc>().add(
                ExamenEvent.finalizado(usuarioId: usuarioId),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Tiempo agotado! Finalizando examen...'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<ExamenBloc, ExamenState>(
        builder: (context, state) {
          if (state is InicialExamen || state is Cargando) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is Error) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.mensaje,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('VOLVER'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          if (state is EnCurso) {
            // Iniciamos el bloc de progreso si no está ya funcionando
            _iniciarProgreso(context, state);

            return _VistaExamen(
              examenId: examenId,
              usuarioId: usuarioId,
              examenState: state,
            );
          }

          return const Scaffold(
            body: Center(child: Text('Estado no manejado')),
          );
        },
      ),
    );
  }

  void _iniciarProgreso(BuildContext context, EnCurso state) {
    // Solo iniciamos si estamos en el primer estado
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
}

class _VistaExamen extends StatelessWidget {
  final String examenId;
  final String usuarioId;
  final EnCurso examenState;

  const _VistaExamen({
    required this.examenId,
    required this.usuarioId,
    required this.examenState,
  });

  @override
  Widget build(BuildContext context) {
    final preguntaActual = examenState.preguntaActual;
    final totalPreguntas = examenState.examen.preguntas.length;
    final indiceActual = examenState.indicePreguntaActual;
    final respuestas = examenState.respuestas;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pregunta ${indiceActual + 1} de $totalPreguntas',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<ProgresoBloc, ProgresoState>(
            builder: (context, state) {
              if (state is EnCursoP) {
                return TemporizadorWidget(segundos: state.tiempoRestantes);
              }
              return const SizedBox.shrink();
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Guardar progreso',
            onPressed: () {
              context.read<ExamenBloc>().add(
                ProgresoGuardadoExamen(
                  examenId: examenId,
                  usuarioId: usuarioId,
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Progreso guardado'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de progreso
          BlocBuilder<ProgresoBloc, ProgresoState>(
            builder: (context, state) {
              if (state is EnCursoP) {
                return ProgresoBarraWidget(
                  total: state.totalPreguntas,
                  completadas: state.preguntasRespondidas,
                  indicePreguntaActual: indiceActual,
                );
              }
              return const SizedBox.shrink();
            },
          ),

          // Contenido principal
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0A5F38), // Verde pizarrón
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Tarjeta de pregunta
                        PreguntaCardWidget(
                          pregunta: preguntaActual,
                          numeroPregunta: indiceActual + 1,
                        ),
                        const SizedBox(height: 24),

                        // Opciones de respuesta
                        if (preguntaActual.tipo == 'multiple-choice')
                          ..._buildOpciones(
                            context,
                            preguntaActual,
                            respuestas[preguntaActual.id],
                          ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Barra de navegación inferior
          _BarraNavegacion(
            indiceActual: indiceActual,
            totalPreguntas: totalPreguntas,
            usuarioId: usuarioId,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOpciones(
    BuildContext context,
    PreguntaEntity pregunta,
    String? respuestaSeleccionada,
  ) {
    return pregunta.opciones.map((opcion) {
      final seleccionada = respuestaSeleccionada == opcion.texto;

      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: OpcionPreguntaWidget(
          texto: opcion.texto,
          seleccionada: seleccionada,
          onTap: () {
            // Registramos la respuesta en el ExamenBloc
            context.read<ExamenBloc>().add(
              RespuestaSeleccionada(
                preguntaId: pregunta.id,
                respuesta: opcion.texto,
                usuarioId: usuarioId,
              ),
            );

            // Actualizamos también el ProgresoBloc
            context.read<ProgresoBloc>().add(
              PreguntaRespondida(
                preguntaId: pregunta.id,
                respuesta: opcion.texto,
                indicePreguntaActual: examenState.indicePreguntaActual,
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

  const _BarraNavegacion({
    required this.indiceActual,
    required this.totalPreguntas,
    required this.usuarioId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Color(0xFF172A52),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón anterior
          ElevatedButton.icon(
            onPressed:
                indiceActual > 0
                    ? () {
                      context.read<ExamenBloc>().add(
                        PreguntaCambiada(nuevaIndice: indiceActual - 1),
                      );
                    }
                    : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Anterior'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              disabledBackgroundColor: Colors.grey.shade700,
            ),
          ),

          // Botón finalizar
          ElevatedButton.icon(
            onPressed: () {
              // Mostramos diálogo de confirmación
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Finalizar examen'),
                      content: const Text(
                        '¿Estás seguro de que deseas finalizar el examen? '
                        'No podrás volver a editarlo.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('CANCELAR'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<ExamenBloc>().add(
                              ExamenEvent.finalizado(usuarioId: usuarioId),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('FINALIZAR'),
                        ),
                      ],
                    ),
              );
            },
            icon: const Icon(Icons.done_all),
            label: const Text('Finalizar'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),

          // Botón siguiente
          ElevatedButton.icon(
            onPressed:
                indiceActual < totalPreguntas - 1
                    ? () {
                      context.read<ExamenBloc>().add(
                        PreguntaCambiada(nuevaIndice: indiceActual + 1),
                      );
                    }
                    : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Siguiente'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              disabledBackgroundColor: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
