import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: isMobile ? 20 : 40,
          ),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: FadeInAnimation(
            delay: Duration(milliseconds: 400),
            child: _buildIllustration(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInAnimation(
          delay: Duration(milliseconds: 400),
          child: _buildIllustration(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final scale = maxWidth < 600 ? 2.0 : .7;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Prepárate con nosotros',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 40 * scale,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'desde cualquier lugar con profesores ',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 27 * scale,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: 'expertos',
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontSize: 32 * scale,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryOrange,
                      decorationThickness: 2,
                    ),
                  ),
                  TextSpan(
                    text: ' ✨',
                    style: TextStyle(fontSize: 32 * scale, height: 1.2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'consigue el ingreso a la preparatoria o universidad que quieras',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16 * scale,
                height: 1.5,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIllustration() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final scale = maxWidth < 600 ? 2.0 : .9;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Elementos decorativos
            Positioned(
              left: 10 * scale,
              bottom: 50 * scale,
              child: Container(
                width: 40 * scale,
                height: 40 * scale,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightBlue.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(8 * scale),
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: 30,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.star,
                  color: AppColors.primaryGreen.withValues(alpha: .7),
                  size: 30,
                ),
              ),
            ),

            // Ilustraciones principales
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // Personaje izquierdo (estudiante sentado)
                SizedBox(
                  width: 210 * scale,
                  height: 500 * scale,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: SvgPicture.asset(
                          ImagesUtils.form1,
                          height: 280 * scale,
                          width: 150 * scale,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          ImagesUtils.menSit,
                          height: 300 * scale,
                          width: 150 * scale,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50 * scale),
                _buildContent(),
                // Personaje derecho (profesor)
                SizedBox(
                  width: 210 * scale,
                  height: 500,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        child: SvgPicture.asset(
                          ImagesUtils.form2,
                          width: 280 * scale,
                          height: 300 * scale,
                        ),
                      ),
                      Positioned(
                        top: 80,
                        child: SvgPicture.asset(
                          ImagesUtils.womanSit,
                          height: 280 * scale,
                          width: 100 * scale,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
