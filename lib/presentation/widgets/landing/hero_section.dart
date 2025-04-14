import 'package:erelis/config/app_colors.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart'
    as responsive_builder;
import 'package:erelis/presentation/widgets/animations/fade_in_animation.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return responsive_builder.ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Determinamos el tipo de dispositivo
        final isMobile =
            sizingInformation.deviceScreenType ==
            responsive_builder.DeviceScreenType.mobile;
        final isTablet =
            sizingInformation.deviceScreenType ==
            responsive_builder.DeviceScreenType.tablet;

        // Determinamos el padding basado en el tipo de dispositivo
        final horizontalPadding =
            isMobile
                ? 16.0
                : isTablet
                ? 32.0
                : 64.0;
        final verticalPadding = isMobile ? 20.0 : 40.0;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: _buildResponsiveLayout(sizingInformation),
        );
      },
    );
  }

  // Método unificado para construir el layout basado en el tamaño
  Widget _buildResponsiveLayout(
    responsive_builder.SizingInformation sizingInfo,
  ) {
    final isMobile =
        sizingInfo.deviceScreenType ==
        responsive_builder.DeviceScreenType.mobile;
    final isTablet =
        sizingInfo.deviceScreenType ==
        responsive_builder.DeviceScreenType.tablet;

    // Para dispositivos móviles, usamos un layout de columna
    if (isMobile) {
      return Column(
        children: [
          FadeInAnimation(
            delay: Duration(milliseconds: 300),
            child: _buildContent(sizingInfo),
          ),
          const SizedBox(height: 24),
          FadeInAnimation(
            delay: Duration(milliseconds: 500),
            child: _buildIllustration(sizingInfo),
          ),
        ],
      );
    }
    // Para tablets, ajustamos el layout con proporciones diferentes
    else if (isTablet) {
      return Column(
        children: [
          FadeInAnimation(
            delay: Duration(milliseconds: 300),
            child: _buildContent(sizingInfo),
          ),
          const SizedBox(height: 32),
          FadeInAnimation(
            delay: Duration(milliseconds: 500),
            child: _buildIllustration(sizingInfo),
          ),
        ],
      );
    }
    // Para desktop, usamos un layout en fila
    else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: FadeInAnimation(
              delay: Duration(milliseconds: 300),
              child: _buildContent(sizingInfo),
            ),
          ),
          Expanded(
            flex: 7,
            child: FadeInAnimation(
              delay: Duration(milliseconds: 500),
              child: _buildIllustration(sizingInfo),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildContent(responsive_builder.SizingInformation sizingInfo) {
    // Determinamos las escalas basadas en el tipo y tamaño del dispositivo
    final isMobile =
        sizingInfo.deviceScreenType ==
        responsive_builder.DeviceScreenType.mobile;
    final isTablet =
        sizingInfo.deviceScreenType ==
        responsive_builder.DeviceScreenType.tablet;

    // Factores de escala adaptables
    final titleScale =
        isMobile
            ? 0.6
            : isTablet
            ? 0.8
            : 1.0;
    final subtitleScale =
        isMobile
            ? 0.7
            : isTablet
            ? 0.85
            : 1.0;
    final bodyScale =
        isMobile
            ? 0.8
            : isTablet
            ? 0.9
            : 1.0;

    // Alineación de texto dependiendo del dispositivo
    final crossAxisAlignment =
        isMobile || isTablet
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Prepárate con nosotros',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 40 * titleScale,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        SizedBox(height: 8 * (isMobile ? 0.8 : 1.0)),
        RichText(
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'desde cualquier lugar con profesores ',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 27 * subtitleScale,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              TextSpan(
                text: 'expertos',
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontSize: 32 * subtitleScale,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryOrange,
                  decorationThickness: 2,
                ),
              ),
              TextSpan(
                text: ' ✨',
                style: TextStyle(fontSize: 32 * subtitleScale, height: 1.2),
              ),
            ],
          ),
        ),
        SizedBox(height: 16 * (isMobile ? 0.8 : 1.0)),
        Text(
          'consigue el ingreso a la preparatoria o universidad que quieras',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16 * bodyScale,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildIllustration(responsive_builder.SizingInformation sizingInfo) {
    // Determinamos las escalas basadas en el tipo y tamaño del dispositivo
    final screenWidth = sizingInfo.screenSize.width;
    final isMobile =
        sizingInfo.deviceScreenType ==
        responsive_builder.DeviceScreenType.mobile;
    final isTablet =
        sizingInfo.deviceScreenType ==
        responsive_builder.DeviceScreenType.tablet;

    // Calculamos la escala de forma más flexible basada en el ancho de pantalla
    final baseScale =
        isMobile
            ? 0.5
            : isTablet
            ? 0.7
            : 0.9;
    final dynamicScale =
        (screenWidth / 1440) * baseScale; // 1440 como ancho de referencia
    final scale = dynamicScale.clamp(
      0.4,
      1.0,
    ); // Limitamos la escala entre 0.4 y 1.0

    // Ajustamos el layout para adaptarse mejor a móviles y tablets
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height:
              isMobile
                  ? 380 * scale
                  : isTablet
                  ? 420 * scale
                  : 500 * scale,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Elementos decorativos que se posicionan relativamente
              Positioned(
                left: constraints.maxWidth * 0.05,
                bottom: constraints.maxHeight * 0.1,
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
                right: constraints.maxWidth * 0.1,
                top: constraints.maxHeight * 0.06,
                child: Container(
                  width: 60 * scale,
                  height: 60 * scale,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(12 * scale),
                  ),
                  child: Icon(
                    Icons.star,
                    color: AppColors.primaryGreen.withValues(alpha: .7),
                    size: 30 * scale,
                  ),
                ),
              ),

              // Contenedor principal con Row o Column según el dispositivo
              isMobile || isTablet
                  ? _buildMobileIllustration(scale, constraints)
                  : _buildDesktopIllustration(scale, constraints),
            ],
          ),
        );
      },
    );
  }

  // Ilustraciones para móvil/tablet - centradas y escaladas
  Widget _buildMobileIllustration(double scale, BoxConstraints constraints) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20 * scale,
        children: [
          // Personaje izquierdo (estudiante sentado)
          SizedBox(
            width: 280 * scale,
            height: 380 * scale,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  child: SvgPicture.asset(
                    ImagesUtils.form1,
                    height: 300 * scale,
                    width: 180 * scale,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20 * scale,
                  child: SvgPicture.asset(
                    ImagesUtils.menSit,
                    height: 320 * scale,
                    width: 120 * scale,
                  ),
                ),
              ],
            ),
          ),
          // Personaje derecho (profesor)
          SizedBox(
            width: 280 * scale,
            height: 380 * scale,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 40 * scale,
                  child: SvgPicture.asset(
                    ImagesUtils.form2,
                    height: 300 * scale,
                    width: 180 * scale,
                  ),
                ),
                Positioned(
                  top: 20 * scale,
                  left: 40 * scale,
                  child: SvgPicture.asset(
                    ImagesUtils.womanSit,
                    height: 320 * scale,
                    width: 120 * scale,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Ilustraciones para desktop - distribuidas horizontalmente
  Widget _buildDesktopIllustration(double scale, BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Personaje izquierdo (estudiante sentado)
        Expanded(
          child: SizedBox(
            height: 400 * scale,
            child: Stack(
              clipBehavior: Clip.none,
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
                  left: 20 * scale,
                  child: SvgPicture.asset(
                    ImagesUtils.menSit,
                    height: 300 * scale,
                    width: 150 * scale,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Personaje derecho (profesor)
        Expanded(
          child: SizedBox(
            height: 400 * scale,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 60 * scale,
                  child: SvgPicture.asset(
                    ImagesUtils.form2,
                    width: 280 * scale,
                    height: 300 * scale,
                  ),
                ),
                Positioned(
                  top: 80 * scale,
                  left: 40 * scale,
                  child: SvgPicture.asset(
                    ImagesUtils.womanSit,
                    height: 280 * scale,
                    width: 100 * scale,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
