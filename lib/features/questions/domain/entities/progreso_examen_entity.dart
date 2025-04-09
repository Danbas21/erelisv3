/// Entidad que representa el progreso de un usuario en un examen.
///
///
library;

import 'package:freezed_annotation/freezed_annotation.dart';
part 'progreso_examen_entity.freezed.dart';

@freezed
sealed class ProgresoExamenEntity with _$ProgresoExamenEntity {
  const factory ProgresoExamenEntity({
    required String examenId,
    required String usuarioId,
    required Map<String, String>
    respuestas, // Map<preguntaId, respuestaSeleccionada>
    required int preguntaActual,
    required bool completado,
    required DateTime ultimaModificacion,
    int? puntajeObtenido,
  }) = _ProgresoExamenEntity;
}
