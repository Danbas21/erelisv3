// lib/features/salon/presentation/widgets/subject_card.dart
import 'package:erelis/config/routes.dart';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:erelis/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/features/salon/domain/models/subject_model.dart';

class SubjectCard extends StatefulWidget {
  final SubjectModel subject;
  final VoidCallback onOpenUnit;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.onOpenUnit,
  });

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final List<String> coverImages = [
    ImagesUtils.habilidadVerbal,
    ImagesUtils.espanol,
    ImagesUtils.historiaMx,
    ImagesUtils.matematicas,
    ImagesUtils.geografia,
    ImagesUtils.biologia,
    ImagesUtils.historiaUniversal,
    ImagesUtils.quimica,
    ImagesUtils.fisica,
  ];

  String getCoverImageForSubject(SubjectModel subject) {
    // Mapeo directo basado en el título del tema
    switch (subject.title.toLowerCase()) {
      case 'matemáticas':
        return ImagesUtils.matematicas;
      case 'español':
        return ImagesUtils.espanol;
      case 'historia de méxico':
        return ImagesUtils.historiaMx;
      case 'geografía':
        return ImagesUtils.geografia;
      case 'biología':
        return ImagesUtils.biologia;
      case 'historia universal':
        return ImagesUtils.historiaUniversal;
      case 'química':
        return ImagesUtils.quimica;
      case 'física':
        return ImagesUtils.fisica;
      case 'habilidad verbal':
        return ImagesUtils.habilidadVerbal;
      case 'civismo y ética':
        return ImagesUtils.civismo;
      default:
        return ImagesUtils.habilidadVerbal;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    // bucle for para obtener la imagen de la lista,
                    getCoverImageForSubject(widget.subject),

                    fit: BoxFit.contain,

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.cardBackground,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.subject.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  bottom: 12.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    print(
                      "Navegando a unidades con courseId: ${widget.subject.id}",
                    );

                    navigationService.navigateTo(
                      AppRoutes.units,
                      arguments: {'courseId': widget.subject.id},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('abrir unidad'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
