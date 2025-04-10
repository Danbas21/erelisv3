import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:erelis/config/failures.dart';

import 'package:erelis/features/questions/data/models/progreso_examen_model.dart';
import 'package:erelis/features/questions/domain/entities/option_entity.dart';

import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import 'package:erelis/features/questions/domain/repository/examen_repository.dart';

import '../../domain/entities/examen_entity.dart';
import '../../domain/entities/pregunta_entity.dart';

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
      print("Buscando examen con ID: $examenId");

      // Extraer courseId y unitId del examenId combinado
      String courseId, unitId;

      if (examenId.contains('_')) {
        // El ID es combinado (courseId_unitId)
        final parts = examenId.split('_');
        courseId = parts[0];
        unitId = parts[1];
      } else {
        // Podría ser solo el unitId
        unitId = examenId;

        // Intenta obtener el courseId de alguna manera
        // Si no es posible, usa un ID fijo (esto debes adaptarlo)
        courseId = 'LJE1qjDXnOAfL9Hu4aQE'; // ID fijo para pruebas
      }

      print("Buscando preguntas en courses/$courseId/units/$unitId/questions");

      // Buscar las preguntas
      final preguntasSnapshot =
          await _firestore
              .collection('courses')
              .doc(courseId)
              .collection('units')
              .doc(unitId)
              .collection('questions')
              .orderBy('order')
              .get();

      print(
        "Encontradas ${preguntasSnapshot.docs.length} preguntas para el examen",
      );

      if (preguntasSnapshot.docs.isEmpty) {
        return Left(
          Failure(
            mensaje: 'No se encontraron preguntas para este examen',
            message: 'No se encontraron preguntas para este examen',
          ),
        );
      }

      // Construir lista de preguntas
      final List<PreguntaEntity> preguntas = [];

      for (var doc in preguntasSnapshot.docs) {
        final data = doc.data();

        // Construir opciones
        final List<OpcionEntity> opciones = [];

        if (data['options'] != null && data['options'] is List) {
          for (var option in data['options']) {
            opciones.add(
              OpcionEntity(
                texto: option['text'] ?? '',
                esCorrecta: option['isCorrect'] ?? false,
              ),
            );
          }
        }

        // Añadir pregunta
        preguntas.add(
          PreguntaEntity(
            id: doc.id,
            texto: data['text'] ?? 'Pregunta sin texto',
            tipo: data['type'] ?? 'multiple-choice',
            puntos: data['points'] ?? 1,
            opciones: opciones,
            explicacion: data['explanation'] ?? '',
            orden: data['order'] ?? 0,
          ),
        );
      }

      // Crear examen con las preguntas encontradas
      final examen = ExamenEntity(
        id: examenId,
        titulo: 'Examen', // Puedes intentar obtener el título de la unidad
        preguntas: preguntas,
        fechaCreacion: DateTime.now(),
        tiempoLimiteMinutos: 30,
        completado: false,
        puntajeTotal: preguntas.fold(
          0,
          (sum, pregunta) => sum + pregunta.puntos,
        ),
        puntajeObtenido: 0,
      );

      print("Examen construido con ${preguntas.length} preguntas");

      return Right(examen);
    } catch (e) {
      print("Error en obtenerExamen: $e");
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
