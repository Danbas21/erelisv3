import 'package:erelis/features/questions/data/repository/examen_repository_impl.dart';
import 'package:erelis/features/questions/presentation/blocs/progreso/progreso_bloc.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:erelis/features/unidad/presentation/blocs/use_progress/use_progress_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../config/responsive_utils.dart' show ResponsiveUtils;
import '../../../questions/domain/entities/examen_entity.dart';

import '../blocs/units/units_bloc.dart';
import '../widgets/animated_list_item.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/unit_card_widget.dart';
import 'test_intro_page.dart';
import 'unit_detail_page.dart';

class UnitsPage extends StatefulWidget {
  final String courseId;
  final String courseName;

  const UnitsPage({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  @override
  State<UnitsPage> createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Inicializar el controlador explícitamente si no lo has hecho ya
    _scrollController = ScrollController();

    context.read<UnitsBloc>().add(
      UnitsEvent.started(widget.courseId, widget.courseName),
    );

    _scrollController.addListener(() {
      print(
        "Scroll position: ${_scrollController.position.pixels} / ${_scrollController.position.maxScrollExtent}",
      );

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.8) {
        print("Reached 80% of scroll");
        final state = context.read<UnitsBloc>().state;
        print("State is Loaded: ${state is Loaded}");
        print(
          "hasMoreUnits: ${state is Loaded ? (state).hasMoreUnits : 'N/A'}",
        );

        if (state is Loaded && state.hasMoreUnits) {
          print("Loading more units");
          context.read<UnitsBloc>().add(const UnitsEvent.loadMore());
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return Scaffold(
      appBar:
          isDesktop
              ? null
              : AppBar(
                title: Text(widget.courseName),
                centerTitle: false,
                backgroundColor: AppColors.primary,
                foregroundColor: const Color.fromARGB(255, 53, 11, 11),
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {
                      // Acción para el perfil del usuario
                    },
                  ),
                ],
              ),
      drawer:
          isDesktop
              ? null
              : Drawer(
                child: SidebarWidget(
                  defaultCourseId: widget.courseId,
                  defaultCourseName: widget.courseName,
                ),
              ),
      body: Row(
        children: [
          // Sidebar en desktop y tablet landscape
          if (isDesktop ||
              (isTablet &&
                  MediaQuery.of(context).orientation == Orientation.landscape))
            const SidebarWidget(),
          // Contenido principal
          Expanded(
            child: Column(
              children: [
                // Header solo visible en desktop
                if (isDesktop) _buildHeader(),
                // Título del curso
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    children: [
                      Text(widget.courseName, style: AppTextStyles.h1),
                      const Spacer(),
                      _buildFilterDropdown(),
                    ],
                  ),
                ),
                // Lista de unidades
                Expanded(
                  child: BlocBuilder<UnitProgressBloc, UnitProgressState>(
                    builder: (context, progressState) {
                      return BlocBuilder<UnitsBloc, UnitsState>(
                        builder: (context, state) {
                          if (state is Initial &&
                              progressState is InitialProgress) {
                            return const Center(
                              child: Text("Inicializando..."),
                            );
                          }
                          return switch (state) {
                            Initial() => const Center(
                              child: Text("Inicializando..."),
                            ),
                            Loading() => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            Loaded loaded => _buildUnitsList(context, loaded),
                            Empty empty => Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    empty.message,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Volver'),
                                  ),
                                ],
                              ),
                            ),
                            Completed completed => Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 64,
                                    color: Colors.green[300],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Unidad ${completed.unidadId} completada",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.green[700]),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed:
                                        () => context.read<UnitsBloc>().add(
                                          UnitsEvent.started(
                                            widget.courseId,
                                            widget.courseName,
                                          ),
                                        ),
                                    child: const Text('Volver a cargar'),
                                  ),
                                ],
                              ),
                            ),
                            Error error => Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64,
                                    color: Colors.red[300],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Error: ${error.message}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red[700]),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed:
                                        () => context.read<UnitsBloc>().add(
                                          UnitsEvent.started(
                                            widget.courseId,
                                            widget.courseName,
                                          ),
                                        ),
                                    child: const Text('Reintentar'),
                                  ),
                                ],
                              ),
                            ),
                          };
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Agregar botón flotante para acceder directamente a los exámenes
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     _mostrarExamenes(context);
      //   },
      //   icon: const Icon(Icons.quiz),
      //   label: const Text('Exámenes'),
      //   backgroundColor: AppColors.primaryOrange,
      // ),
    );
  }

  // Método para mostrar los exámenes disponibles en un modal
  void _mostrarExamenes(BuildContext context) async {
    final examenes = await _fetchExamenes();
    if (!mounted) return;

    if (examenes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No hay exámenes disponibles para este curso'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.quiz, color: AppColors.primaryLightBlue),
                    const SizedBox(width: 10),
                    Text("Exámenes disponibles", style: AppTextStyles.h3),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: examenes.length,
                    itemBuilder: (context, index) {
                      final examen = examenes[index];
                      return _buildExamenItem(context, examen);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildExamenItem(BuildContext context, ExamenEntity examen) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryLightBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.assignment, color: AppColors.primaryLightBlue),
        ),
        title: Text(examen.titulo, style: AppTextStyles.h3),
        subtitle: Text(
          "${examen.preguntas.length} preguntas · ${examen.tiempoLimiteMinutos} minutos",
          style: AppTextStyles.body2,
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Cerrar el modal
            Navigator.pop(context);

            // Navegar a la pantalla de inicio del examen
            _navegarAExamen(context, examen);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryOrange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("Iniciar"),
        ),
      ),
    );
  }

  // Método para navegar a la pantalla de inicio del examen
  void _navegarAExamen(BuildContext context, ExamenEntity examen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => TestProviders(
              child: TestIntroPage(
                courseId: widget.courseId,
                unitId: examen.id,
                title: examen.titulo,
                questionCount: examen.preguntas.length,
                timeLimit: examen.tiempoLimiteMinutos,
              ),
            ),
      ),
    );
  }

  // Método para obtener los exámenes disponibles
  Future<List<ExamenEntity>> _fetchExamenes() async {
    try {
      final examRepository = ExamenRepositoryImpl();
      final result = await examRepository.obtenerExamenes(widget.courseId);

      return result.fold((failure) => [], (examenes) => examenes);
    } catch (e) {
      print("Error al cargar exámenes: $e");
      return [];
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo de la plataforma
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.school, color: Colors.white),
          ),
          const SizedBox(width: 16),
          // Título de la plataforma
          Text('Plataforma Educativa', style: AppTextStyles.h2),
          const Spacer(),
          // Foto del usuario
          const CircleAvatar(
            radius: 20,
            child: Icon(Icons.account_circle, size: 40),
          ),
          const SizedBox(width: 12),
          // Nombre del usuario
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nombre del Usuario',
                style: AppTextStyles.body1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Estudiante', style: AppTextStyles.body2),
            ],
          ),
          const SizedBox(width: 16),
          // Botón de notificaciones
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: AppColors.textSecondary,
            ),
            onPressed: () {
              // Acción para mostrar notificaciones
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButton<String>(
      value: 'Todas',
      underline: Container(),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: const [
        DropdownMenuItem(value: 'Todas', child: Text('Todas las unidades')),
        DropdownMenuItem(value: 'Completadas', child: Text('Completadas')),
        DropdownMenuItem(value: 'Pendientes', child: Text('Pendientes')),
      ],
      onChanged: (value) {
        // Aquí iría la lógica de filtrado
      },
    );
  }

  Widget _buildUnitsList(BuildContext context, Loaded state) {
    // Usa todas las unidades en lugar de limitar
    final units = state.units;
    final padding = ResponsiveUtils.getContentPadding(context);

    final List unidades =
        units.where((u) => u.title.startsWith('Unidad ')).toList()
          ..sort((a, b) {
            final numeroA = int.tryParse(a.title.split(' ')[1]) ?? 0;
            final numeroB = int.tryParse(b.title.split(' ')[1]) ?? 0;
            return numeroA.compareTo(numeroB);
          });
    final List examenes =
        units.where((u) => u.title.toLowerCase().contains('examen')).toList();
    final List cuestionarios =
        units.where((u) => u.title.startsWith('Cuestionario:')).toList();
    final List ordenados = [...unidades, ...cuestionarios, ...examenes];

    final unidadesCompletadas =
        progresoList.where((p) => p.isCompleted).map((p) => p.unidadId).toSet();

    if (units.isEmpty) {
      return const Center(
        child: Text('No hay unidades disponibles para este curso.'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<UnitsBloc>().add(
          UnitsEvent.started(widget.courseId, widget.courseName),
        );
      },

      child: ListView.builder(
        controller: _scrollController,
        padding: padding,
        itemCount: ordenados.length,
        itemBuilder: (context, index) {
          final unit = ordenados[index];
          return AnimatedListItem(
            index: index,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => UnitDetailPage(
                          unitId: unit.id,
                          cursoid: unit.courseId,
                        ),
                  ),
                );
              },
              child: UnitCardWidget(unit: unit),
            ),
          );
        },
      ),
    );
  }
}
