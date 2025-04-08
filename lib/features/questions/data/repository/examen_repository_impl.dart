import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:erelis/config/failures.dart';
import 'package:erelis/features/questions/data/models/progreso_examen_model.dart';
import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';

import '../../domain/entities/examen_entity.dart';
import '../../domain/entities/pregunta_entity.dart';

import '../models/examen_model.dart';
import '../models/pregunta_model.dart';

/// Implementación del repositorio de exámenes que utiliza Firebase Firestore.
class ExamenRepositoryImpl implements ExamenRepository {
  final FirebaseFirestore _firestore;

  ExamenRepositoryImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // Referencias a colecciones de Firestore
  CollectionReference get _examenesRef => _firestore.collection('examenes');
  CollectionReference get _progresosRef => _firestore.collection('progresos');

  @override
  Future<Either<Failure, ExamenEntity>> obtenerExamen(String examenId) async {
    try {
      final docSnapshot = await _examenesRef.doc(examenId).get();

      if (!docSnapshot.exists) {
        return Left(Failure(message: 'Examen no encontrado', mensaje: ''));
      }

      final examenModel = ExamenModel.fromFirestore(
        docSnapshot as DocumentSnapshot<Map<String, dynamic>>,
      );

      return Right(examenModel.toEntity());
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener el examen: ${e.toString()}',
          message: '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ExamenEntity>>> obtenerExamenes(
    String usuarioId,
  ) async {
    try {
      // Obtenemos los exámenes disponibles para el usuario
      final querySnapshot =
          await _examenesRef
              .where('disponiblePara', arrayContains: usuarioId)
              .get();

      final examenes =
          querySnapshot.docs
              .map(
                (doc) =>
                    ExamenModel.fromFirestore(
                      doc as DocumentSnapshot<Map<String, dynamic>>,
                    ).toEntity(),
              )
              .toList();

      return Right(examenes);
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener los exámenes: ${e.toString()}',
          message: '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> guardarProgreso(
    ProgresoExamenEntity progreso,
  ) async {
    try {
      // Creamos el ID del documento con la combinación de examenId y usuarioId
      final docId = '${progreso.examenId}_${progreso.usuarioId}';

      // Convertimos la entidad a modelo y luego a mapa para Firestore
      final progresoModel = ProgresoExamenModel.fromEntity(progreso);

      // Guardamos o actualizamos el progreso
      await _progresosRef
          .doc(docId)
          .set(
            progresoModel.toFirestore(),
            SetOptions(
              merge: true,
            ), // Fusionamos para mantener campos existentes
          );

      return const Right(unit);
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al guardar el progreso: ${e.toString()}',
          message: '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProgresoExamenEntity?>> obtenerProgreso(
    String examenId,
    String usuarioId,
  ) async {
    try {
      final docId = '${examenId}_$usuarioId';
      final docSnapshot = await _progresosRef.doc(docId).get();

      if (!docSnapshot.exists) {
        return const Right(null); // No hay progreso guardado
      }

      final progresoModel = ProgresoExamenModel.fromFirestore(
        docSnapshot as DocumentSnapshot<Map<String, dynamic>>,
      );

      return Right(progresoModel.toEntity());
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener el progreso: ${e.toString()}',
          message: '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> finalizarExamen(
    String examenId,
    String usuarioId,
    Map<String, String> respuestas,
  ) async {
    try {
      // Obtenemos el examen para verificar las respuestas
      final examenResult = await obtenerExamen(examenId);

      return examenResult.fold((failure) => Left(failure), (examen) async {
        // Calculamos el puntaje
        int puntajeObtenido = 0;

        for (final pregunta in examen.preguntas) {
          final respuesta = respuestas[pregunta.id];
          if (respuesta != null && verificarRespuesta(pregunta, respuesta)) {
            puntajeObtenido += pregunta.puntos;
          }
        }

        // Actualizamos el progreso con el estado completado y el puntaje
        final progresoEntity = ProgresoExamenEntity(
          examenId: examenId,
          usuarioId: usuarioId,
          respuestas: respuestas,
          preguntaActual: examen.preguntas.length - 1, // Última pregunta
          completado: true,
          ultimaModificacion: DateTime.now(),
          puntajeObtenido: puntajeObtenido,
        );

        // Guardamos el progreso final
        final resultado = await guardarProgreso(progresoEntity);

        return resultado.fold(
          (failure) => Left(failure),
          (_) => Right(puntajeObtenido),
        );
      });
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al finalizar el examen: ${e.toString()}',
          message: '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PreguntaEntity>> obtenerPregunta(
    String examenId,
    int ordenPregunta,
  ) async {
    try {
      // Obtenemos el examen completo
      final examenResult = await obtenerExamen(examenId);

      return examenResult.fold((failure) => Left(failure), (examen) {
        // Buscamos la pregunta por su orden
        final preguntasFiltradas =
            examen.preguntas.where((p) => p.orden == ordenPregunta).toList();

        if (preguntasFiltradas.isEmpty) {
          return Left(Failure(mensaje: 'Pregunta no encontrada', message: ''));
        }

        return Right(preguntasFiltradas.first);
      });
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener la pregunta: ${e.toString()}',
          message: '',
        ),
      );
    }
  }

  @override
  bool verificarRespuesta(PreguntaEntity pregunta, String respuesta) {
    // Para preguntas de opción múltiple
    if (pregunta.tipo == 'multiple-choice') {
      // Buscamos la opción seleccionada
      final opcionSeleccionada =
          pregunta.opciones
              .where((opcion) => opcion.texto == respuesta)
              .toList();

      if (opcionSeleccionada.isEmpty) {
        return false;
      }

      return opcionSeleccionada.first.esCorrecta;
    }

    // Para otros tipos de preguntas (implementación a expandir)
    return false;
  }
}
