import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:erelis/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart'
    as responsive_builder;
import 'package:erelis/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_event.dart';
import 'package:erelis/presentation/widgets/common/custom_button.dart';
import 'package:erelis/config/routes.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  // Hacemos esto accesible para usarlo en LandingPage
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return responsive_builder.ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType ==
            responsive_builder.DeviceScreenType.mobile;

        return AppBar(
          backgroundColor: AppColors.background,
          elevation: 1,
          automaticallyImplyLeading: false,
          toolbarHeight: 80.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _buildLogo()),
              if (!isMobile) ...[SizedBox(width: 10), _buildNavItems()],
            ],
          ),
          actions: [
            if (!isMobile) ...[
              _buildActionButtons(),
              SizedBox(width: 15),
            ] else ...[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Abrimos el drawer en lugar de expandir el AppBar
                  widget.scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              SizedBox(width: 10),
            ],
          ],
        );
      },
    );
  }

  Widget buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Encabezado del drawer
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menú',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el drawer
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1),

            // Contenido del menú
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                children: [
                  _buildMobileNavItem(
                    context,
                    'Home',
                    () => _navigateToSection(context, 'hero'),
                  ),
                  _buildMobileNavItem(
                    context,
                    'Cursos',
                    () => _navigateToSection(context, 'courses'),
                  ),
                  _buildMobileNavItem(context, 'Acerca', () {}),
                  _buildMobileNavItem(context, 'Blog', () {}),
                  _buildMobileNavItem(context, 'Contacto', () {}),
                  Divider(height: 32, thickness: 1),
                  // Botones de acción
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomButton(
                      text: 'Ingresar',
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra el drawer
                        NavigationService().navigateTo(AppRoutes.login);
                      },
                      type: ButtonType.outlined,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomButton(
                      text: 'Registrarse',
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra el drawer
                        NavigationService().navigateTo(AppRoutes.register);
                      },
                      type: ButtonType.filled,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () {
        NavigationService().navigateTo(AppRoutes.landing);
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            _buildSvgWithFallback(
              ImagesUtils.logo,
              width: 30,
              height: 55,
              fallbackIcon: Icons.school,
            ),
            SizedBox(width: 8),
            _buildSvgWithFallback(
              ImagesUtils.iconLogo,
              width: 40,
              height: 40,
              fallbackIcon: Icons.bookmark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgWithFallback(
    String assetPath, {
    required double width,
    required double height,
    required IconData fallbackIcon,
  }) {
    try {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        placeholderBuilder:
            (context) => Icon(fallbackIcon, size: width, color: Colors.white70),
      );
    } catch (e) {
      return Icon(fallbackIcon, size: width, color: Colors.white70);
    }
  }

  Widget _buildNavItems() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildNavItem('Home', () => _navigateToSection(context, 'hero')),
        _buildNavItem('Cursos', () => _navigateToSection(context, 'courses')),
        _buildNavItem('Acerca', () => {}),
        _buildNavItem('Blog', () => {}),
        _buildNavItem('Contacto', () => {}),
      ],
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Cierra el drawer
        onTap();
      },
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        CustomButton(
          text: 'Ingresar',
          onPressed: () {
            NavigationService().navigateTo(AppRoutes.login);
          },
          type: ButtonType.outlined,
          height: 50,
          width: 100,
        ),
        SizedBox(width: 10),
        CustomButton(
          text: 'Registrarse',
          onPressed: () {
            NavigationService().navigateTo(AppRoutes.register);
          },
          type: ButtonType.filled,
          height: 50,
          width: 100,
        ),
      ],
    );
  }

  void _navigateToSection(BuildContext context, String sectionKey) {
    context.read<NavigationBloc>().add(
      NavigateToSection(sectionKey: sectionKey),
    );
  }
}
