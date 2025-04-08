import 'package:freezed_annotation/freezed_annotation.dart';
import 'pregunta_entity.dart';

part 'examen_entity.freezed.dart';

/// Entidad que representa un examen completo con sus preguntas y estado.
@freezed
sealed class ExamenEntity with _$ExamenEntity {
  const factory ExamenEntity({
    required String id,
    required String titulo,
    required List<PreguntaEntity> preguntas,
    required DateTime fechaCreacion,
    DateTime? fechaFinalizacion,
    required int tiempoLimiteMinutos,
    required bool completado,
    required int puntajeTotal,
    required int puntajeObtenido,
  }) = _ExamenEntity;
}
