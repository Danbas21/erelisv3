// lib/config/routes.dart

import 'package:erelis/features/questions/presentation/providers/examenes%20_providers.dart';
import 'package:erelis/features/salon/presentation/pages/salon_screen.dart';
import 'package:erelis/features/unidad/presentation/pages/units_page.dart';
import 'package:erelis/presentation/pages/diagnostic.dart';
import 'package:erelis/presentation/pages/landing_page.dart';
import 'package:erelis/presentation/pages/login_screen.dart';
import 'package:erelis/presentation/pages/registration_screen.dart';
import 'package:flutter/material.dart';

// Importaciones para el módulo de exámenes

import 'package:erelis/features/questions/presentation/screens/inicio_examen_screen.dart';
import 'package:erelis/features/unidad/presentation/pages/test_intro_page.dart';
import 'package:erelis/features/questions/presentation/screens/resultados_screen.dart';

class AppRoutes {
  static const String landing = '/initial';
  static const String login = '/login';
  static const String register = '/register';
  static const String diagnostic = '/diagnostic';
  static const String dashboard = '/dashboard';
  static const String courses = '/courses';
  static const String courseDetail = '/course-detail';
  static const String salon = '/salon';
  static const String units = '/units';
  static const String courseUnits = '/course-units';
  static const String unitContent = '/unidad';
  static const String testIntro = '/courses/:courseId/units/:unitId/test';
  static const String test = '/courses/:courseId/units/:unitId/test/start';
  static const String testResults =
      '/courses/:courseId/units/:unitId/test/results';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Intentamos extraer parámetros de la URL para rutas dinámicas
    final uri = Uri.parse(settings.name ?? '');
    final pathSegments = uri.pathSegments;

    switch (settings.name) {
      case landing:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case diagnostic:
        return MaterialPageRoute(builder: (_) => DiagnosticDashboardScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => SalonScreen());
      case salon:
        return MaterialPageRoute(builder: (_) => const SalonScreen());
      case units:
        Map<String, dynamic> args = {};

        // Verificar si hay argumentos y extraerlos de manera segura
        if (settings.arguments != null) {
          args = settings.arguments as Map<String, dynamic>;
        }

        // Extraer el courseId de los argumentos, con un valor predeterminado vacío
        final String courseId = args['courseId'] as String? ?? '';
        final String courseName = args['title'] as String? ?? '';

        return MaterialPageRoute(
          builder: (_) => UnitsPage(courseId: courseId, courseName: courseName),
        );

      // Manejar la ruta de intro del examen (distinguimos por el patrón de la URL)
      case testIntro:
        // Si es una ruta con formato dinámico, extraemos los parámetros
        if (pathSegments.length >= 5 &&
            pathSegments[0] == 'courses' &&
            pathSegments[2] == 'units' &&
            pathSegments[4] == 'test') {
          final courseId = pathSegments[1];
          final unitId = pathSegments[3];

          // Extraemos argumentos adicionales si están disponibles
          Map<String, dynamic> args = {};
          if (settings.arguments != null) {
            args = settings.arguments as Map<String, dynamic>;
          }

          // Obtenemos título y otros parámetros con valores predeterminados
          final title = args['title'] as String? ?? 'Examen';
          final questionCount = args['questionCount'] as int? ?? 0;
          final timeLimit = args['timeLimit'] as int? ?? 30;

          return MaterialPageRoute(
            builder:
                (_) => TestProviders(
                  child: TestIntroPage(
                    courseId: courseId,
                    unitId: unitId,
                    title: title,
                    questionCount: questionCount,
                    timeLimit: timeLimit,
                  ),
                ),
          );
        }
        break;

      // Manejar la ruta del examen
      case test:
        if (pathSegments.length >= 6 &&
            pathSegments[0] == 'courses' &&
            pathSegments[2] == 'units' &&
            pathSegments[4] == 'test' &&
            pathSegments[5] == 'start') {
          final courseId = pathSegments[1];
          final unitId = pathSegments[3];

          // Extraemos argumentos adicionales
          Map<String, dynamic> args = {};
          if (settings.arguments != null) {
            args = settings.arguments as Map<String, dynamic>;
          }

          // Para el examen necesitamos el ID de examen y usuario
          final examenId = args['examenId'] as String? ?? '${courseId}_$unitId';
          final usuarioId = args['usuarioId'] as String? ?? 'user_current';
          final titulo = args['titulo'] as String? ?? 'Examen';

          return MaterialPageRoute(
            builder:
                (_) => TestProviders(
                  child: InicioExamenScreen(
                    examenId: examenId,
                    usuarioId: usuarioId,
                    titulo: titulo,
                  ),
                ),
          );
        }
        break;

      // Manejar la ruta de resultados del examen
      case testResults:
        if (pathSegments.length >= 6 &&
            pathSegments[0] == 'courses' &&
            pathSegments[2] == 'units' &&
            pathSegments[4] == 'test' &&
            pathSegments[5] == 'results') {
          // En este caso, normalmente los resultados se mostrarían automáticamente
          // al finalizar el examen, pero si necesitamos acceder directamente:
          Map<String, dynamic> args = {};
          if (settings.arguments != null) {
            args = settings.arguments as Map<String, dynamic>;
          }

          // Extraemos los parámetros necesarios para mostrar resultados
          return MaterialPageRoute(
            builder:
                (_) => TestProviders(
                  child: ResultadosScreen(
                    examen: args['examen'],
                    puntajeObtenido: args['puntajeObtenido'] ?? 0,
                    totalPreguntas: args['totalPreguntas'] ?? 0,
                    preguntasRespondidas: args['preguntasRespondidas'] ?? 0,
                    respuestasCorrectas: args['respuestasCorrectas'] ?? 0,
                  ),
                ),
          );
        }
        break;

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('Ruta no definida: ${settings.name}')),
              ),
        );
    }

    // Si no se puede manejar la ruta, mostramos una página de error
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            body: Center(child: Text('Ruta no válida: ${settings.name}')),
          ),
    );
  }
}
