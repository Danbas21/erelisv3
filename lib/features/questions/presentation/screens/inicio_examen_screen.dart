import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/examen_entity.dart';

import '../blocs/examen/examen_bloc.dart';
import 'cuestionario_screen.dart';

/// Pantalla de inicio del examen.
class InicioExamenScreen extends StatelessWidget {
  final String examenId;
  final String usuarioId;
  final String? titulo;

  const InicioExamenScreen({
    super.key,
    required this.examenId,
    required this.usuarioId,
    this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ExamenBloc(examenRepository: context.read<ExamenRepository>()),
      child: _InicioExamenView(
        examenId: examenId,
        usuarioId: usuarioId,
        titulo: titulo,
      ),
    );
  }
}

class _InicioExamenView extends StatefulWidget {
  final String examenId;
  final String usuarioId;
  final String? titulo;

  const _InicioExamenView({
    required this.examenId,
    required this.usuarioId,
    this.titulo,
  });

  @override
  State<_InicioExamenView> createState() => _InicioExamenViewState();
}

class _InicioExamenViewState extends State<_InicioExamenView> {
  ExamenEntity? examen;
  bool cargando = true;
  String? error;

  @override
  void initState() {
    super.initState();
    // Intentamos cargar el examen
    _cargarExamen();
  }

  Future<void> _cargarExamen() async {
    final repository = context.read<ExamenRepository>();
    final result = await repository.obtenerExamen(widget.examenId);

    result.fold(
      (failure) => setState(() {
        cargando = false;
        error = failure.mensaje;
      }),
      (exameneEntity) => setState(() {
        examen = exameneEntity;
        cargando = false;
      }),
    );
  }

  void _iniciarExamen() {
    context.read<ExamenBloc>().add(
      ExamenEvent.iniciado(
        examenId: widget.examenId,
        usuarioId: widget.usuarioId,
      ),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => CuestionarioScreen(
              examenId: widget.examenId,
              usuarioId: widget.usuarioId,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo ?? 'Examen'), elevation: 0),
      body: Container(
        // Estilo pizarrón
        decoration: BoxDecoration(
          color: const Color(0xFF0A5F38), // Verde escolar
          border: Border.all(
            color: const Color(0xFF8B4513), // Marrón "madera"
            width: 8.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        margin: const EdgeInsets.all(16.0),
        child:
            cargando
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
                : error != null
                ? _ErrorWidget(mensaje: error!)
                : _ContenidoInicio(examen: examen!, onIniciar: _iniciarExamen),
      ),
    );
  }
}

class _ContenidoInicio extends StatelessWidget {
  final ExamenEntity examen;
  final VoidCallback onIniciar;

  const _ContenidoInicio({required this.examen, required this.onIniciar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título con estilo tiza
          Text(
            examen.titulo,
            style: const TextStyle(
              fontFamily: 'Chalkboard', // Tipografía tipo gis
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.white24,
                  offset: Offset(0.5, 0.5),
                  blurRadius: 3.0,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Detalles del examen
          _InfoExamen(
            label: 'Total de preguntas:',
            valor: '${examen.preguntas.length}',
          ),
          const SizedBox(height: 16),
          _InfoExamen(
            label: 'Tiempo límite:',
            valor: '${examen.tiempoLimiteMinutos} minutos',
          ),
          const SizedBox(height: 16),
          _InfoExamen(
            label: 'Puntos totales:',
            valor: '${examen.puntajeTotal}',
          ),

          const SizedBox(height: 48),

          // Botón de inicio
          ElevatedButton(
            onPressed: onIniciar,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF59E0B), // Naranja
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'INICIAR EXAMEN',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Instrucciones
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instrucciones:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '• Lee cuidadosamente cada pregunta.\n'
                  '• Selecciona la respuesta correcta.\n'
                  '• Puedes navegar entre preguntas usando los botones.\n'
                  '• Tu progreso se guarda automáticamente.\n'
                  '• Al finalizar, presiona el botón "Terminar".',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoExamen extends StatelessWidget {
  final String label;
  final String valor;

  const _InfoExamen({required this.label, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const Spacer(),
        Text(
          valor,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String mensaje;

  const _ErrorWidget({required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.white, size: 64),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              mensaje,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF59E0B),
              ),
              child: const Text('VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}
