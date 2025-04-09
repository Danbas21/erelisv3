// presentation/pages/units_page.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/app_text_styles.dart';
import 'package:erelis/features/questions/data/repository/examen_repository_impl.dart';
import 'package:erelis/features/questions/domain/entities/examen_entity.dart';
import 'package:erelis/features/questions/presentation/screens/inicio_examen_screen.dart';
import 'package:erelis/features/unidad/presentation/blocs/units/units_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Importamos nuestro módulo de exámenes

import '../../../../config/responsive_utils.dart' show ResponsiveUtils;
import '../../../questions/presentation/providers/examenes _providers.dart';
import '../widgets/animated_list_item.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/unit_card_widget.dart';
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
    context.read<UnitsBloc>().add(
      UnitsEvent.started(widget.courseId, widget.courseName),
    );

    _scrollController.addListener(() {
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
      drawer: isDesktop ? null : const Drawer(child: SidebarWidget()),
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
                  child: BlocBuilder<UnitsBloc, UnitsState>(
                    builder: (context, state) {
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Agregar botón flotante para acceder directamente a los exámenes
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _mostrarExamenes(context);
        },
        icon: const Icon(Icons.quiz),
        label: const Text('Exámenes'),
        backgroundColor: AppColors.primaryOrange,
      ),
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
              child: InicioExamenScreen(
                examenId: examen.id,
                usuarioId:
                    'user_current', // Aquí deberías usar el ID real del usuario
                titulo: examen.titulo,
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
            backgroundImage: NetworkImage('https://placeholder.com/user'),
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
    final displayedUnits = state.units.take(state.displayedCount).toList();
    final padding = ResponsiveUtils.getContentPadding(context);

    if (displayedUnits.isEmpty) {
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
        itemCount: displayedUnits.length + (state.hasMoreUnits ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == displayedUnits.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final unit = displayedUnits[index];
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
                          cursoid: unit.courseId, // Añade el courseId aquí
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
