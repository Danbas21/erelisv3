import 'package:dartz/dartz.dart';
import 'package:erelis/config/failures.dart';
import 'package:erelis/features/questions/domain/entities/progreso_examen_entity.dart';
import '../entities/examen_entity.dart';
import '../entities/pregunta_entity.dart';

/// Interfaz para el repositorio de exámenes.
/// Define las operaciones disponibles para interactuar con los exámenes.
abstract class ExamenRepository {
  /// Obtiene un examen por su ID.
  Future<Either<Failure, ExamenEntity>> obtenerExamen(String examenId);

  /// Obtiene todos los exámenes disponibles para un usuario.
  Future<Either<Failure, List<ExamenEntity>>> obtenerExamenes(String usuarioId);

  /// Guarda el progreso de un examen.
  Future<Either<Failure, Unit>> guardarProgreso(ProgresoExamenEntity progreso);

  /// Obtiene el progreso de un examen para un usuario específico.
  Future<Either<Failure, ProgresoExamenEntity?>> obtenerProgreso(
    String examenId,
    String usuarioId,
  );

  /// Marca un examen como completado y calcula el puntaje.
  Future<Either<Failure, int>> finalizarExamen(
    String examenId,
    String usuarioId,
    Map<String, String> respuestas,
  );

  /// Obtiene una pregunta específica de un examen.
  Future<Either<Failure, PreguntaEntity>> obtenerPregunta(
    String examenId,
    int ordenPregunta,
  );

  /// Verifica si una respuesta es correcta.
  bool verificarRespuesta(PreguntaEntity pregunta, String respuesta);
}
