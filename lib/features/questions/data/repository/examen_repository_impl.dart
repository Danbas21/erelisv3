import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:erelis/config/failures.dart';
import 'package:erelis/features/questions/data/models/opcion_model.dart';
import 'package:erelis/features/questions/data/models/pregunta_model.dart';
import 'package:erelis/features/questions/data/models/progreso_examen_model.dart';

import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';

import '../../domain/entities/examen_entity.dart';
import '../../domain/entities/pregunta_entity.dart';

import '../models/examen_model.dart';

/// Implementación del repositorio de exámenes que utiliza Firebase Firestore.
class ExamenRepositoryImpl implements ExamenRepository {
  final FirebaseFirestore _firestore;

  ExamenRepositoryImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // Referencias a colecciones de Firestore
  CollectionReference get _cursosRef => _firestore.collection('courses');
  CollectionReference get _progresosRef =>
      _firestore.collection('progresos_examenes');

  @override
  Future<Either<Failure, ExamenEntity>> obtenerExamen(String examenId) async {
    try {
      // El examenId puede ser courseId_unitId
      final partes = examenId.split('_');
      if (partes.length != 2) {
        return Left(
          Failure(
            mensaje: 'ID de examen inválido',
            message: 'ID de examen inválido',
          ),
        );
      }

      final courseId = partes[0];
      final unitId = partes[1];

      // Obtenemos las preguntas del curso para la unidad específica
      final preguntasSnapshot =
          await _cursosRef
              .doc(courseId)
              .collection('unidades')
              .doc(unitId)
              .collection('preguntas')
              .get();

      if (preguntasSnapshot.docs.isEmpty) {
        return Left(
          Failure(
            mensaje: 'No se encontraron preguntas para este examen',
            message: 'No se encontraron preguntas para este examen',
          ),
        );
      }

      // Obtenemos el documento de la unidad para obtener el título
      final unitDoc =
          await _cursosRef
              .doc(courseId)
              .collection('unidades')
              .doc(unitId)
              .get();

      if (!unitDoc.exists) {
        return Left(
          Failure(
            mensaje: 'La unidad no existe',
            message: 'La unidad no existe',
          ),
        );
      }

      final unitData = unitDoc.data();
      final String tituloExamen = unitData?['title'] ?? 'Examen sin título';

      // Procesamos las preguntas
      final List<PreguntaModel> preguntas = [];

      for (var doc in preguntasSnapshot.docs) {
        final data = doc.data();

        // Procesamos las opciones de la pregunta
        final opcionesData = (data['options'] as List<dynamic>?) ?? [];
        final List<OpcionModel> opciones =
            opcionesData.map((opcionData) {
              final opcion = opcionData as Map<String, dynamic>;
              return OpcionModel(
                texto: opcion['text'] as String? ?? '',
                esCorrecta: opcion['isCorrect'] as bool? ?? false,
              );
            }).toList();

        // Creamos el modelo de pregunta
        final pregunta = PreguntaModel(
          id: doc.id,
          texto: data['text'] as String? ?? '',
          tipo: data['type'] as String? ?? 'multiple-choice',
          puntos: data['points'] as int? ?? 1,
          opciones: opciones,
          explicacion: data['explanation'] as String? ?? '',
          orden: data['order'] as int? ?? 0,
        );

        preguntas.add(pregunta);
      }

      // Ordenamos las preguntas por su orden
      preguntas.sort((a, b) => a.orden.compareTo(b.orden));

      // Calculamos el puntaje total
      final puntajeTotal = preguntas.fold<int>(
        0,
        (sum, pregunta) => sum + pregunta.puntos,
      );

      // Creamos el modelo de examen
      final examenModel = ExamenModel(
        id: examenId,
        titulo: tituloExamen,
        preguntas: preguntas,
        fechaCreacion: DateTime.now(),
        tiempoLimiteMinutos: 30, // Por defecto 30 minutos
        completado: false,
        puntajeTotal: puntajeTotal,
        puntajeObtenido: 0,
      );

      return Right(examenModel.toEntity());
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener el examen: ${e.toString()}',
          message: 'Error al obtener el examen: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ExamenEntity>>> obtenerExamenes(
    String usuarioId,
  ) async {
    try {
      // En este sistema, los exámenes están dentro de las unidades de los cursos
      // Por lo que necesitamos obtener todos los cursos a los que tiene acceso el usuario
      final cursosSnapshot =
          await _firestore
              .collection('usuarios')
              .doc(usuarioId)
              .collection('cursos')
              .get();

      final List<ExamenEntity> examenes = [];

      // Para cada curso, obtenemos sus unidades
      for (var cursoDoc in cursosSnapshot.docs) {
        final cursoId = cursoDoc.id;

        final unidadesSnapshot =
            await _cursosRef.doc(cursoId).collection('unidades').get();

        // Para cada unidad, verificamos si tiene preguntas
        for (var unidadDoc in unidadesSnapshot.docs) {
          final unidadId = unidadDoc.id;

          final preguntasSnapshot =
              await _cursosRef
                  .doc(cursoId)
                  .collection('unidades')
                  .doc(unidadId)
                  .collection('preguntas')
                  .limit(
                    1,
                  ) // Solo necesitamos saber si hay al menos una pregunta
                  .get();

          if (preguntasSnapshot.docs.isNotEmpty) {
            // Esta unidad tiene preguntas, por lo que la consideramos un examen
            unidadDoc.data();

            // Creamos un examenId combinando cursoId y unidadId
            final examenId = '${cursoId}_$unidadId';

            // Obtenemos el examen completo
            final examenResult = await obtenerExamen(examenId);

            examenResult.fold(
              (failure) => {}, // Ignoramos fallos individuales
              (examen) => examenes.add(examen),
            );
          }
        }
      }

      return Right(examenes);
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener los exámenes: ${e.toString()}',
          message: 'Error al obtener los exámenes: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> guardarProgreso(
    ProgresoExamenEntity progreso,
  ) async {
    try {
      // Convertimos la entidad a modelo y luego a mapa para Firestore
      final progresoModel = ProgresoExamenModel.fromEntity(progreso);

      // Creamos el ID del documento combinando examenId y usuarioId
      final docId = '${progreso.examenId}_${progreso.usuarioId}';

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
          message: 'Error al guardar el progreso: ${e.toString()}',
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
          message: 'Error al obtener el progreso: ${e.toString()}',
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
          message: 'Error al finalizar el examen: ${e.toString()}',
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
          return Left(
            Failure(
              mensaje: 'Pregunta no encontrada',
              message: 'Pregunta no encontrada',
            ),
          );
        }

        return Right(preguntasFiltradas.first);
      });
    } catch (e) {
      return Left(
        Failure(
          mensaje: 'Error al obtener la pregunta: ${e.toString()}',
          message: 'Error al obtener la pregunta: ${e.toString()}',
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
