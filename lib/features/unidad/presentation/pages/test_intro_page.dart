import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../questions/presentation/screens/cuestionario_screen.dart';
import '../../../../config/app_colors.dart';

class TestIntroPage extends StatelessWidget {
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
    required this.timeLimit,
  });

  @override
  Widget build(BuildContext context) {
    // ID del examen: combinación de courseId y unitId
    final examenId = '${courseId}_$unitId';

    // ID del usuario (en una app real, obtendrías esto del servicio de autenticación)
    final usuarioId = 'user_current';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Examen'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
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
        child: _buildContent(context, examenId, usuarioId),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    String examenId,
    String usuarioId,
  ) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título con estilo tiza
          Text(
            title,
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
          _buildInfoRow('Total de preguntas:', '$questionCount'),
          const SizedBox(height: 16),
          _buildInfoRow('Tiempo límite:', '$timeLimit minutos'),

          const SizedBox(height: 16),
          _buildInfoRow('Unidad:', title),

          const SizedBox(height: 48),

          // Botón de inicio
          ElevatedButton(
            onPressed: () => _iniciarExamen(context, examenId, usuarioId),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF59E0B), // Naranja
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'COMENZAR EXAMEN',
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
                  '• Al finalizar, presiona el botón "Finalizar".',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _iniciarExamen(
    BuildContext context,
    String examenId,
    String usuarioId,
  ) async {
    // Combinar courseId y unitId para formar un ID único
    final combinedId = "${courseId}_$unitId";

    // Verificar si el examen existe
    final examenRepository = context.read<ExamenRepository>();
    final resultado = await examenRepository.obtenerExamen(examenId);

    // Si el examen no existe, mostramos un error
    resultado.fold((failure) => _mostrarError(context, failure.mensaje), (
      examen,
    ) {
      // CRUCIAL: Usar TestProviders para proporcionar TODOS los BLoCs necesarios
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => TestProviders(
                child: CuestionarioScreen(
                  examenId: combinedId,
                  usuarioId: usuarioId,
                ),
              ),
        ),
      );
    });
  }

  void _mostrarError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(mensaje),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ACEPTAR'),
              ),
            ],
          ),
    );
  }
}
