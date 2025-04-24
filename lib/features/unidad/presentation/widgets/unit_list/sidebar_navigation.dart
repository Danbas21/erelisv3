// lib/presentation/widgets/unit_list/sidebar_navigation.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:erelis/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SidebarItem {
  final String title;
  final IconData icon;
  final String route;

  SidebarItem({required this.title, required this.icon, required this.route});
}

class SidebarNavigation extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SidebarNavigation({
    super.key,
    required this.isExpanded,
    required this.onToggle,
  });
  @override
  Widget build(BuildContext context) {
    final items = [
      SidebarItem(title: 'Tablero', icon: Icons.dashboard, route: '/dashboard'),
      SidebarItem(
        title: 'Calendario',
        icon: Icons.calendar_today,
        route: '/calendar',
      ),
      SidebarItem(
        title: 'Biblioteca',
        icon: Icons.local_library,
        route: '/library',
      ),
      SidebarItem(title: 'Salón', icon: Icons.class_, route: '/classroom'),
      SidebarItem(title: 'Cursos', icon: Icons.school, route: '/courses'),
      SidebarItem(
        title: 'Integración',
        icon: Icons.integration_instructions,
        route: '/integration',
      ),
      SidebarItem(
        title: 'Asignaturas',
        icon: Icons.assignment,
        route: '/assignments',
      ),
      SidebarItem(
        title: 'Asistencia',
        icon: Icons.people,
        route: '/attendance',
      ),
      SidebarItem(title: 'Mensajes', icon: Icons.message, route: '/messages'),
      SidebarItem(title: 'Ayuda', icon: Icons.help, route: '/help'),
      SidebarItem(
        title: 'Configuración',
        icon: Icons.settings,
        route: '/settings',
      ),
      SidebarItem(title: 'Salir', icon: Icons.logout, route: '/initial'),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isExpanded ? 250 : 70,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSidebarHeader(),
          const Divider(color: AppColors.divider),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildSidebarItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarHeader() {
    // Si la barra está expandida, mostramos texto y botón
    if (isExpanded) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'CURSOS ERELIS',
                style: TextStyle(
                  color: AppColors.primaryLightBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: AppColors.textPrimary,
              onPressed: onToggle,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      );
    }
    // Si la barra está contraída, mostramos solo un logo centrado y pequeño
    else {
      return GestureDetector(
        onTap: onToggle,
        child: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            ImagesUtils.logo,
            height: 40,
            width: 40,
            colorFilter: ColorFilter.mode(
              AppColors.primaryLightBlue,

              BlendMode.srcIn,
            ),
          ),
        ),
      );
    }
  }

  Widget _buildSidebarItem(SidebarItem item) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: isExpanded ? 16.0 : 0,
        vertical: 2.0,
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: isExpanded ? 0 : 25),
        child: Icon(item.icon, color: AppColors.primaryLightBlue),
      ),
      title:
          isExpanded
              ? Text(
                item.title,
                style: const TextStyle(color: AppColors.textPrimary),
              )
              : null,
      onTap: () {
        if (item.route == '/') {
          // Handle logout separately
        } else {
          NavigationService().navigateTo(item.route);
        }
      },
    );
  }
}
