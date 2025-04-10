import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/questions/data/repository/examen_repository_impl.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';
import 'package:erelis/features/questions/presentation/blocs/examen/examen_bloc.dart';
import 'package:erelis/features/questions/presentation/blocs/progreso/progreso_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget que proporciona todos los BLoCs y repositorios necesarios
/// para el funcionamiento del módulo de exámenes.
class TestProviders extends StatelessWidget {
  final Widget child;

  const TestProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Proporcionamos AMBOS: repositorio y BLoCs
    return RepositoryProvider<ExamenRepository>(
      create:
          (context) =>
              ExamenRepositoryImpl(firestore: FirebaseFirestore.instance),
      child: MultiBlocProvider(
        providers: [
          // Importante: Proporcionar TODOS los BLoCs necesarios
          BlocProvider<ExamenBloc>(
            create:
                (context) => ExamenBloc(
                  examenRepository: context.read<ExamenRepository>(),
                ),
          ),
          BlocProvider<ProgresoBloc>(
            create:
                (context) => ProgresoBloc(
                  examenRepository: context.read<ExamenRepository>(),
                ),
          ),
        ],
        child: child,
      ),
    );
  }
}
