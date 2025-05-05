import 'package:erelis/features/questions/data/repository/examen_repository_impl.dart';
import 'package:erelis/features/questions/presentation/blocs/progreso/progreso_bloc.dart';
import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:erelis/features/unidad/domain/entities/unit_user_data.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Iniciar la carga de unidades
    _loadUnits();

    // Configurar el listener para carga paginada
    _setupScrollListener();
  }

  void _loadUnits() {
    context.read<UnitsBloc>().add(
      UnitsEvent.started(widget.courseId, widget.courseName),
    );
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      // Si llegamos al 80% del scroll, cargar más unidades
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.8) {
        final state = context.read<UnitsBloc>().state;

        if (state is Loaded && state.hasMoreUnits) {
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
    final showSidebar =
        isDesktop ||
        (isTablet &&
            MediaQuery.of(context).orientation == Orientation.landscape);

    return Scaffold(
      appBar: _buildAppBar(isDesktop),
      drawer: _buildDrawer(isDesktop),
      body: Row(
        children: [
          // Sidebar condicional
          if (showSidebar) const SidebarWidget(),

          // Contenido principal
          Expanded(
            child: Column(
              children: [
                // Header condicional
                if (isDesktop) _buildHeader(),

                // Título del curso y filtro
                _buildTitleBar(),

                // Lista de unidades
                Expanded(child: _buildUnitsContent()),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => _mostrarExamenes(context),
      //   icon: const Icon(Icons.quiz),
      //   label: const Text('Exámenes'),
      //   backgroundColor: AppColors.primaryOrange,
      // ),
    );
  }

  PreferredSizeWidget? _buildAppBar(bool isDesktop) {
    if (isDesktop) return null;

    return AppBar(
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
    );
  }

  Widget? _buildDrawer(bool isDesktop) {
    if (isDesktop) return null;

    return Drawer(
      child: SidebarWidget(
        defaultCourseId: widget.courseId,
        defaultCourseName: widget.courseName,
      ),
    );
  }

  Widget _buildTitleBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Text(widget.courseName, style: AppTextStyles.h1),
          const Spacer(),
          _buildFilterDropdown(),
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

  Widget _buildUnitsContent() {
    return BlocBuilder<UnitProgressBloc, UnitProgressState>(
      builder: (context, progressState) {
        return BlocBuilder<UnitsBloc, UnitsState>(
          builder: (context, state) {
            // Estado inicial
            if (state is Initial && progressState is InitialProgress) {
              return const Center(child: Text("Inicializando..."));
            }

            // Manejo de diferentes estados
            return switch (state) {
              Initial() => const Center(child: Text("Inicializando...")),
              Loading() => const Center(child: CircularProgressIndicator()),
              Loaded loaded => _buildUnitsList(
                context,
                loaded,
                progressState is LoadedProgress ? [] : [],
              ),
              Empty empty => _buildEmptyState(empty),
              Completed completed => _buildCompletedState(completed),
              Error error => _buildErrorState(error),
            };
          },
        );
      },
    );
  }

  Widget _buildEmptyState(Empty empty) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.folder_open, size: 64, color: Colors.grey[400]),
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
    );
  }

  Widget _buildCompletedState(Completed completed) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_outline, size: 64, color: Colors.green[300]),
          const SizedBox(height: 16),
          Text(
            "Unidad ${completed.unidadId} completada",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green[700]),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _loadUnits(),
            child: const Text('Volver a cargar'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(Error error) {
    return Center(
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
            onPressed: () => _loadUnits(),
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitsList(
    BuildContext context,
    Loaded state,
    List<UnidadProgreso> progresoList,
  ) {
    final units = state.units;
    final padding = ResponsiveUtils.getContentPadding(context);

    // Si no hay unidades
    if (units.isEmpty) {
      return const Center(
        child: Text('No hay unidades disponibles para este curso.'),
      );
    }

    // Ordenar unidades
    final sortedUnits = _getSortedUnits(units);

    // Mapeo de progreso por unidadId
    final Map<String, UnidadProgreso> progresoPorUnidad = {};
    for (final p in progresoList) {
      progresoPorUnidad[p.unidadId] = p;
    }

    return RefreshIndicator(
      onRefresh: () async {
        _loadUnits();
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: padding,
        itemCount: sortedUnits.length,
        itemBuilder: (context, index) {
          final unit = sortedUnits[index];
          final progreso = progresoPorUnidad[unit.id];
          final isCompleted = progreso?.isCompleted ?? false;

          return AnimatedListItem(
            index: index,
            child: GestureDetector(
              onTap: () => _navigateToUnitDetails(unit),
              child: UnitCardWidget(unit: unit, isCompleted: isCompleted),
            ),
          );
        },
      ),
    );
  }

  void _navigateToUnitDetails(dynamic unit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                UnitDetailPage(unitId: unit.id, cursoid: unit.courseId),
      ),
    );
  }

  List _getSortedUnits(List units) {
    // Separar unidades por tipo
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

    // Combinar todas las listas
    return [...unidades, ...cuestionarios, ...examenes];
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
          // Datos del usuario
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

  // Método para mostrar los exámenes disponibles
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

    _showExamenesBottomSheet(context, examenes);
  }

  void _showExamenesBottomSheet(
    BuildContext context,
    List<ExamenEntity> examenes,
  ) {
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
                _buildExamenesHeader(context),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: examenes.length,
                    itemBuilder:
                        (context, index) =>
                            _buildExamenItem(context, examenes[index]),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildExamenesHeader(BuildContext context) {
    return Row(
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
}
