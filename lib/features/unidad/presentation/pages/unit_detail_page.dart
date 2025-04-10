import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/config/responsive_utils.dart';
import 'package:erelis/features/questions/domain/entities/examen_entity.dart';
import 'package:erelis/features/questions/domain/entities/option_entity.dart';
import 'package:erelis/features/questions/domain/entities/pregunta_entity.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:erelis/features/unidad/presentation/pages/test_intro_page.dart';
import 'package:erelis/features/unidad/presentation/widgets/unit_content_widget.dart';
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
  String? selectedText;
  String? activeHighlightColor;
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
            Loaded success => _buildContent(success.unit, context, success),
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

  Widget _buildContent(Unit unit, BuildContext context, Loaded state) {
    return Container(
      color: AppColors.background,
      padding: ResponsiveUtils.getContentPadding(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de la unidad

            // Sección de contenido
            if (unit.content.isNotEmpty)
              UnitContentWidget(
                unit: state.unit,
                highlights: state.highlights,
                onTextSelected: (text) {
                  setState(() {
                    selectedText = text;
                  });
                },
              ),

            const SizedBox(height: 24),

            // Sección de archivos
            if (unit.courseId.isNotEmpty) _buildFilesSection([unit.title]),

            const SizedBox(height: 24),

            // Sección de evaluaciones
            _buildTestsSection(unit),
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
  // Método para obtener los exámenes disponibles
  Future<List<ExamenEntity>> _fetchTests(
    String courseId,
    String unitId,
    String unitTitle,
  ) async {
    try {
      print("Buscando preguntas para el curso $courseId y unidad $unitId");

      // Ruta correcta según tu estructura de Firestore:
      // courses/{courseId}/units/{unitId}/questions
      final preguntasSnapshot =
          await FirebaseFirestore.instance
              .collection('courses')
              .doc(courseId)
              .collection('units')
              .doc(unitId)
              .collection('questions')
              .orderBy(
                'order',
              ) // Ordenamos por el campo order que tienes en tus documentos
              .get();

      print(
        "Número de preguntas encontradas: ${preguntasSnapshot.docs.length}",
      );

      // Si hay preguntas, creamos un examen con ellas
      if (preguntasSnapshot.docs.isNotEmpty) {
        final List<PreguntaEntity> preguntas = [];

        for (var doc in preguntasSnapshot.docs) {
          final data = doc.data();

          print("Datos de pregunta: ${data.length}");

          // Construimos las opciones según la estructura que tienes
          final List<OpcionEntity> opciones = [];

          if (data['options'] != null && data['options'] is List) {
            for (var option in data['options']) {
              opciones.add(
                OpcionEntity(
                  texto: option['text'] ?? '',
                  esCorrecta: option['isCorrect'] ?? false,
                ),
              );
            }
          }

          // Creamos la entidad de pregunta
          preguntas.add(
            PreguntaEntity(
              id: doc.id,
              texto: data['text'] ?? 'Pregunta sin texto',
              tipo: data['type'] ?? 'multiple-choice',
              puntos: data['points'] ?? 1,
              opciones: opciones,
              explicacion: data['explanation'] ?? '',
              orden:
                  data['order'] ??
                  0, // Usamos el campo order que tienes en tus documentos
            ),
          );
        }

        // Creamos el examen con las preguntas encontradas
        return [
          ExamenEntity(
            id: unitId,
            titulo: 'Examen: $unitTitle',
            preguntas: [],
            fechaCreacion: DateTime.now(),
            tiempoLimiteMinutos: 30,
            completado: false,
            puntajeTotal: preguntas.fold(
              0,
              (sum, pregunta) => sum + pregunta.puntos,
            ),
            puntajeObtenido: 0,
          ),
        ];
      } else {
        print("No se encontraron preguntas para este examen en Firestore");
        // Si no se encuentran preguntas, puedes elegir devolver un examen vacío o uno de prueba
      }

      // Si no se encontraron preguntas, devolvemos un examen de prueba
      return [
        ExamenEntity(
          id: unitId,
          titulo: 'Examen de prueba: $unitTitle',
          fechaCreacion: DateTime.now(),
          tiempoLimiteMinutos: 30,
          completado: false,
          puntajeTotal: 40,
          puntajeObtenido: 0,
          preguntas: [
            PreguntaEntity(
              id: 'pregunta1',
              texto: '¿Cuál es la capital de Francia?',
              tipo: 'multiple-choice',
              puntos: 10,
              opciones: [
                OpcionEntity(texto: 'París', esCorrecta: true),
                OpcionEntity(texto: 'Londres', esCorrecta: false),
                OpcionEntity(texto: 'Berlín', esCorrecta: false),
                OpcionEntity(texto: 'Madrid', esCorrecta: false),
              ],
              explicacion: 'París es la capital de Francia.',
              orden: 1,
            ),
            // Añade más preguntas de ejemplo si lo deseas
          ],
        ),
      ];
    } catch (e) {
      print("Error al cargar exámenes: $e");
      // Si ocurre un error, imprimimos detalles para depuración
      print(e.toString());
      if (e is FirebaseException) {
        print("Código de error: ${e.code}");
        print("Mensaje: ${e.message}");
      }
      return [];
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Fecha no disponible';
    return '${date.day}/${date.month}/${date.year}';
  }
}
