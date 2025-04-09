import 'package:erelis/features/questions/domain/entities/examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:erelis/features/questions/presentation/blocs/examen/examen_bloc.dart';
import 'package:erelis/features/questions/presentation/screens/cuestionario_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/app_text_styles.dart';

/// Pantalla de introducción al examen que se muestra antes de iniciar.
class TestIntroPage extends StatefulWidget {
  final String courseId;
  final String unitId;
  final String title;
  final int questionCount;
  final int timeLimit;

  const TestIntroPage({
    super.key,
    required this.courseId,
    required this.unitId,
    required this.title,
    required this.questionCount,
    this.timeLimit = 30, // Tiempo límite por defecto en minutos
  });

  @override
  State<TestIntroPage> createState() => _TestIntroPageState();
}

class _TestIntroPageState extends State<TestIntroPage> {
  bool cargando = true;
  ExamenEntity? examen;
  String? error;

  @override
  void initState() {
    super.initState();
    _cargarExamen();
  }

  Future<void> _cargarExamen() async {
    try {
      final repository = context.read<ExamenRepository>();

      // Intentamos cargar los datos del examen
      final result = await repository.obtenerExamen(
        "${widget.courseId}_${widget.unitId}",
      );

      result.fold(
        (failure) => setState(() {
          cargando = false;
          error = failure.mensaje;
        }),
        (examenEntity) => setState(() {
          examen = examenEntity;
          cargando = false;
        }),
      );
    } catch (e) {
      setState(() {
        cargando = false;
        error = "Error al cargar el examen: $e";
      });
    }
  }

  void _iniciarExamen() {
    // Verificamos si tenemos un examen válido
    if (examen == null) return;

    final String usuarioId =
        "usuario_actual"; // Esto debería obtenerse de tu sistema de autenticación

    // Inicializamos el BLoC con el examen cargado
    context.read<ExamenBloc>().add(
      ExamenEvent.iniciado(examenId: examen!.id, usuarioId: usuarioId),
    );

    // Navegamos a la pantalla del cuestionario
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) =>
                CuestionarioScreen(examenId: examen!.id, usuarioId: usuarioId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.primaryDarkBlue,
        foregroundColor: Colors.white,
        elevation: 0,
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
        child:
            cargando
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
                : error != null
                ? _buildErrorView()
                : _buildContenido(),
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.white, size: 64),
            const SizedBox(height: 16),
            const Text(
              'Error',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
              ),
              child: const Text('VOLVER'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContenido() {
    final totalPreguntas = examen?.preguntas.length ?? widget.questionCount;
    final tiempoLimite = examen?.tiempoLimiteMinutos ?? widget.timeLimit;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título con estilo tiza
          Text(
            widget.title,
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
          _buildInfoItem(
            label: 'Total de preguntas:',
            valor: '$totalPreguntas',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'Tiempo límite:',
            valor: '$tiempoLimite minutos',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            label: 'Puntos totales:',
            valor: '${examen?.puntajeTotal ?? 100}',
          ),

          const SizedBox(height: 48),

          // Botón de inicio
          ElevatedButton(
            onPressed: _iniciarExamen,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryOrange,
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
              color: Colors.white.withOpacity(0.1),
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

  Widget _buildInfoItem({required String label, required String valor}) {
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
