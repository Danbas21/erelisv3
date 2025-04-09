import 'package:erelis/features/questions/domain/entities/examen_entity.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:erelis/features/unidad/presentation/pages/test_intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/app_text_styles.dart';

import 'package:erelis/features/unidad/domain/entities/unit.dart';
import 'package:erelis/features/unidad/presentation/blocs/unit_detail/unit_detail_bloc.dart';

class UnitDetailPage extends StatefulWidget {
  final String unitId;
  final String cursoid;

  const UnitDetailPage({
    super.key,
    required this.unitId,
    required this.cursoid,
  });

  @override
  State<UnitDetailPage> createState() => _UnitDetailPageState();
}

class _UnitDetailPageState extends State<UnitDetailPage> {
  @override
  void initState() {
    super.initState();
    // Inicializar el bloc de detalle de unidad
    context.read<UnitDetailBloc>().add(
      UnitDetailEvent.loadUnit(unitId: widget.unitId, courseId: widget.cursoid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UnitDetailBloc, UnitDetailState>(
          builder: (context, state) {
            if (state is Loaded) {
              return Text(state.unit.title);
            }
            return const Text('Detalle de unidad');
          },
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<UnitDetailBloc, UnitDetailState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const Center(child: Text("Inicializando...")),
            Loading() => const Center(child: CircularProgressIndicator()),
            Loaded success => _buildContent(success.unit),
            Error error => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text(
                    "Error: ${error.message}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red[700]),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        () => context.read<UnitDetailBloc>().add(
                          UnitDetailEvent.loadUnit(
                            unitId: widget.unitId,
                            courseId: widget.cursoid,
                          ),
                        ),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          };
        },
      ),
    );
  }

  Widget _buildContent(Unit unit) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Información de la unidad
          _buildUnitInfo(unit),

          const SizedBox(height: 24),

          // Sección de contenido
          if (unit.content.isNotEmpty) _buildContentSection(unit.content),

          const SizedBox(height: 24),

          // Sección de archivos
          if (unit.content.isNotEmpty)
            _buildFilesSection(unit.courseId as List<String>),

          const SizedBox(height: 24),

          // Sección de evaluaciones
          _buildTestsSection(unit),
        ],
      ),
    );
  }

  Widget _buildUnitInfo(Unit unit) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.school, color: AppColors.primaryLightBlue),
                const SizedBox(width: 10),
                Expanded(child: Text(unit.title, style: AppTextStyles.h2)),
              ],
            ),
            if (unit.content.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(unit.content, style: AppTextStyles.body1),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Actualizada: ${_formatDate(unit.lastVisited)}',
                  style: AppTextStyles.body2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(String content) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.article, color: AppColors.primaryLightBlue),
                const SizedBox(width: 10),
                Text('Contenido', style: AppTextStyles.h3),
              ],
            ),
            const SizedBox(height: 16),
            Text(content, style: AppTextStyles.body1),
          ],
        ),
      ),
    );
  }

  Widget _buildFilesSection(List<String> files) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.attach_file, color: AppColors.primaryLightBlue),
                const SizedBox(width: 10),
                Text('Archivos', style: AppTextStyles.h3),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.insert_drive_file),
                  title: Text(files[index]),
                  trailing: const Icon(Icons.download),
                  onTap: () {
                    // Lógica para descargar el archivo
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestsSection(Unit unit) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.quiz, color: AppColors.primaryLightBlue),
                const SizedBox(width: 10),
                Text('Evaluaciones', style: AppTextStyles.h3),
              ],
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<ExamenEntity>>(
              future: _fetchTests(widget.cursoid, widget.unitId, unit.title),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error al cargar evaluaciones: ${snapshot.error}",
                      style: TextStyle(color: AppColors.error),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Icon(
                          Icons.assignment_late,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "No hay evaluaciones disponibles para esta unidad",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                // Mostrar lista de exámenes disponibles
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final test = snapshot.data![index];
                    return _buildTestItem(
                      context,
                      test,
                      widget.cursoid,
                      widget.unitId,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestItem(
    BuildContext context,
    ExamenEntity test,
    String courseId,
    String unitId,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.secondaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.assignment, color: AppColors.primaryLightBlue),
      ),
      title: Text(
        test.titulo,
        style: AppTextStyles.body1.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "${test.preguntas} preguntas · ${test.fechaCreacion} minutos",
        style: AppTextStyles.body2,
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // Navegar a la página de inicio del examen envolviendo en ExamenProvider
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => TestProviders(
                    child: TestIntroPage(
                      courseId: courseId,
                      unitId: unitId,
                      title: test.titulo,
                      questionCount: test.tiempoLimiteMinutos,
                      timeLimit: test.tiempoLimiteMinutos,
                    ),
                  ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text("Iniciar"),
      ),
    );
  }

  // Método para obtener los exámenes disponibles
  Future<List<Test>> _fetchTests(
    String courseId,
    String unitId,
    String unitTitle,
  ) async {
    try {
      // Verificamos si hay preguntas para esta unidad
      final preguntasSnapshot =
          await FirebaseFirestore.instance
              .collection('cursos')
              .doc(courseId)
              .collection('unidades')
              .doc(unitId)
              .collection('preguntas')
              .count()
              .get();

      // Si hay preguntas, creamos un examen para esta unidad
      if (preguntasSnapshot.count > 0) {
        return [
          Test(
            id: unitId,
            title: 'Examen: $unitTitle',
            description: 'Evaluación de los conocimientos sobre $unitTitle',
            questionCount: preguntasSnapshot.count,
            timeLimit: 30, // Por defecto 30 minutos
            availableAt: DateTime.now(),
            expiresAt: DateTime.now().add(const Duration(days: 365)),
          ),
        ];
      }

      return [];
    } catch (e) {
      print("Error al cargar exámenes: $e");
      return [];
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Fecha no disponible';
    return '${date.day}/${date.month}/${date.year}';
  }
}
