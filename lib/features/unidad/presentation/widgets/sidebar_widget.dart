// presentation/widgets/sidebar_widget.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/responsive_utils.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  final String? defaultCourseId;
  final String? defaultCourseName;
  const SidebarWidget({
    super.key,
    this.defaultCourseId,
    this.defaultCourseName,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final double sidebarWidth = ResponsiveUtils.getSidebarWidth(context);

    return Container(
      width: sidebarWidth,
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSidebarItem(
                  context,
                  Icons.calendar_today,
                  'Calendario',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.school,
                  'Salón',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.book,
                  'Librería',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.library_books,
                  'Cursos',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.link,
                  'Integraciones',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.list_alt,
                  'Asistencia',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.message,
                  'Mensajes',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.help,
                  'Ayuda',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
                _buildSidebarItem(
                  context,
                  Icons.settings,
                  'Configuración',
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
          _buildSidebarItem(
            context,
            Icons.logout,
            'Salir',
            isDesktop: isDesktop,
            isTablet: isTablet,
            isLogout: true,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(
    BuildContext context,
    IconData icon,
    String label, {
    required bool isDesktop,
    required bool isTablet,
    bool isLogout = false,
  }) {
    return Tooltip(
      message: label,
      preferBelow: false,
      verticalOffset: 20,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Aquí iría la navegación o acción correspondiente
            // Navigator.pushNamed(context, '/$label');
            // Por ejemplo, para la opción de Logout:
            //hagamos un switch para que no se rompa la app

            switch (label) {
              case 'Salir':
                // Acción para cerrar sesión
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Cerrar sesión'),
                        content: const Text(
                          '¿Estás seguro de que deseas cerrar sesión?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Aquí iría la lógica para cerrar sesión
                              // Por ejemplo, llamar a un método de autenticación
                              // AuthService.logout();
                              Navigator.pushNamed(context, '/initial');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sesión cerrada')),
                              );
                            },
                            child: const Text('Cerrar sesión'),
                          ),
                        ],
                      ),
                );
                break;
              case 'Calendario':
                Navigator.pushNamed(context, '/calendario');
                break;

              case 'Salón':
                if (defaultCourseId != null && defaultCourseId!.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    '/units',
                    arguments: {
                      'courseId': defaultCourseId,
                      'title': defaultCourseName ?? 'Curso',
                    },
                  );
                } else {
                  // Navegar a la lista de cursos o mostrar un mensaje
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Selecciona un curso primero'),
                    ),
                  );
                  Navigator.pushNamed(context, '/salon');
                }
                break;

              case 'Librería':
                Navigator.pushNamed(context, '/libreria');
                break;
              case 'Cursos':
                Navigator.pushNamed(context, '/cursos');
                break;
              case 'Integraciones':
                Navigator.pushNamed(context, '/integraciones');
                break;
              case 'Asistencia':
                Navigator.pushNamed(context, '/asistencia');
                break;
              case 'Mensajes':
                Navigator.pushNamed(context, '/mensajes');
                break;
              case 'Ayuda':
                Navigator.pushNamed(context, '/ayuda');
                break;
              case 'Configuración':
                Navigator.pushNamed(context, '/configuracion');
                break;
              default:
                // Acción predeterminada o manejo de error
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opción no reconocida')),
                );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: isLogout ? AppColors.error : Colors.white,
                  size: isDesktop ? 28 : 24,
                ),
                if (isDesktop || isTablet) const SizedBox(height: 4),

                Text(
                  label,
                  style: TextStyle(
                    color: isLogout ? AppColors.error : Colors.white,
                    fontSize: isDesktop ? 11 : 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
