import 'package:erelis/features/questions/presentation/blocs/examen/examen_bloc.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
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
    print("Construyendo CuestionarioScreen");

    // Ya NO creamos un nuevo BLoC aquí - lo usamos desde TestProviders
    // Solo iniciamos el examen con el evento
    context.read<ExamenBloc>().add(
      ExamenEvent.iniciado(examenId: examenId, usuarioId: usuarioId),
    );

    return _CuestionarioView(examenId: examenId, usuarioId: usuarioId);
  }
}

class _CuestionarioView extends StatelessWidget {
  final String examenId;
  final String usuarioId;

  const _CuestionarioView({required this.examenId, required this.usuarioId});

  @override
  Widget build(BuildContext context) {
    print("Construyendo _CuestionarioView");

    return MultiBlocListener(
      listeners: [
        BlocListener<ExamenBloc, ExamenState>(
          listener: (context, state) {
            print("Estado del ExamenBloc: ${state.hashCode}");

            if (state is Finalizado) {
              print("Examen finalizado, navegando a resultados");
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder:
                      (_) => TestProviders(
                        child: ResultadosScreen(
                          examen: state.examen,
                          puntajeObtenido: state.puntajeObtenido,
                          totalPreguntas: state.totalPreguntas,
                          preguntasRespondidas: state.preguntasRespondidas,
                          respuestasCorrectas: state.respuestasCorrectas,
                        ),
                      ),
                ),
              );
            } else if (state is Error) {
              print("Error en ExamenBloc: ${state.mensaje}");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.mensaje),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<ExamenBloc, ExamenState>(
        builder: (context, state) {
          print("Construyendo UI para estado: ${state.hashCode}");

          if (state is Inicial || state is Cargando) {
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
    final examenBloc = BlocProvider.of<ExamenBloc>(context);

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
              _mostrarDialogoGuardarProgreso(context);
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
            examenId: examenId,
          ),
        ],
      ),
    );
  }

  // Diálogo para guardar progreso
  void _mostrarDialogoGuardarProgreso(BuildContext context) {
    final examenBloc = BlocProvider.of<ExamenBloc>(context);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Guardar Progreso'),
            content: const Text('¿Qué deseas hacer?'),
            actions: [
              TextButton(
                onPressed: () {
                  // Guardar progreso
                  examenBloc.add(
                    ExamenEvent.progresoGuardado(
                      examenId: examenId,
                      usuarioId: usuarioId,
                    ),
                  );

                  // Cerrar diálogo
                  Navigator.pop(context);

                  // Mostrar confirmación
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Progreso guardado'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('CONTINUAR EXAMEN'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Guardar progreso
                  context.read<ExamenBloc>().add(
                    ExamenEvent.progresoGuardado(
                      examenId: examenId,
                      usuarioId: usuarioId,
                    ),
                  );

                  // Cerrar diálogo
                  Navigator.pop(context);

                  // Volver a la pantalla anterior
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text('GUARDAR Y SALIR'),
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
              ExamenEvent.respuestaSeleccionada(
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
  final String examenId;

  const _BarraNavegacion({
    required this.indiceActual,
    required this.totalPreguntas,
    required this.usuarioId,
    required this.examenId,
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
                        ExamenEvent.preguntaCambiada(
                          nuevaIndice: indiceActual - 1,
                        ),
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

          // Botón guardar y salir (antes "Finalizar")
          ElevatedButton.icon(
            onPressed: () {
              _mostrarDialogoGuardarYSalir(context);
            },
            icon: const Icon(Icons.save),
            label: const Text('Guardar y Salir'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFFF59E0B,
              ), // Cambiado a color naranja
            ),
          ),

          // Botón siguiente
          ElevatedButton.icon(
            onPressed:
                indiceActual < totalPreguntas - 1
                    ? () {
                      context.read<ExamenBloc>().add(
                        ExamenEvent.preguntaCambiada(
                          nuevaIndice: indiceActual + 1,
                        ),
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

  // Diálogo para guardar y salir
  void _mostrarDialogoGuardarYSalir(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Guardar y Salir'),
            content: const Text(
              '¿Deseas guardar tu progreso y salir del examen? '
              'Podrás retomarlo más tarde.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('CONTINUAR EXAMEN'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Guardamos el progreso
                  context.read<ExamenBloc>().add(
                    ExamenEvent.progresoGuardado(
                      examenId: examenId,
                      usuarioId: usuarioId,
                    ),
                  );

                  // Cerramos el diálogo
                  Navigator.pop(context);

                  // Volvemos a la pantalla anterior
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF59E0B),
                ),
                child: const Text('GUARDAR Y SALIR'),
              ),
            ],
          ),
    );
  }
}
