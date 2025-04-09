import 'package:erelis/features/questions/data/repository/examen_repository_impl.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/examen/examen_bloc.dart';
import '../blocs/pregunta/pregunta_bloc.dart';
import '../blocs/progreso/progreso_bloc.dart';

/// Widget que proporciona todos los providers necesarios para el módulo de exámenes.
class TestProviders extends StatelessWidget {
  final Widget child;

  const TestProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proporcionamos el repositorio
        Provider<ExamenRepository>(create: (context) => ExamenRepositoryImpl()),

        // Proporcionamos los BLoCs
        BlocProvider<ExamenBloc>(
          create:
              (context) => ExamenBloc(
                examenRepository: context.read<ExamenRepository>(),
              ),
        ),
        BlocProvider<PreguntaBloc>(create: (context) => PreguntaBloc()),
        BlocProvider<ProgresoBloc>(
          create:
              (context) => ProgresoBloc(
                examenRepository: context.read<ExamenRepository>(),
              ),
        ),
      ],
      child: child,
    );
  }
}

/// Método de extensión para facilitar el acceso a los BLoCs desde cualquier widget.
extension ExamenBlocExtension on BuildContext {
  ExamenBloc get examenBloc => read<ExamenBloc>();
  PreguntaBloc get preguntaBloc => read<PreguntaBloc>();
  ProgresoBloc get progresoBloc => read<ProgresoBloc>();
}
