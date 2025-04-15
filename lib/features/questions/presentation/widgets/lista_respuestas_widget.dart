import 'package:erelis/features/questions/domain/entities/option_entity.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/pregunta_entity.dart';

/// Widget que muestra una lista de las respuestas dadas en el examen.
class ListaRespuestasWidget extends StatelessWidget {
  final List<PreguntaEntity> preguntas;
  final Map<String, String> respuestas;

  const ListaRespuestasWidget({
    super.key,
    required this.preguntas,
    required this.respuestas,
  });

  @override
  Widget build(BuildContext context) {
    // Ordenamos las preguntas por su orden
    final preguntasOrdenadas = List<PreguntaEntity>.from(preguntas)
      ..sort((a, b) => a.orden.compareTo(b.orden));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: preguntasOrdenadas.length,
        separatorBuilder:
            (context, index) =>
                Divider(color: Colors.white.withOpacity(0.2), height: 1),
        itemBuilder: (context, index) {
          final pregunta = preguntasOrdenadas[index];
          final respuestaUsuario = respuestas[pregunta.id];
          final bool respondida = respuestaUsuario != null;

          // Verificamos si la respuesta es correcta
          bool esCorrecta = false;
          if (respondida) {
            final opcionSeleccionada = pregunta.opciones.firstWhere(
              (opcion) => opcion.texto == respuestaUsuario,
              orElse: () => const OpcionEntity(texto: '', esCorrecta: false),
            );
            esCorrecta = opcionSeleccionada.esCorrecta;
          }

          return _ItemRespuesta(
            pregunta: pregunta,
            respuestaUsuario: respuestaUsuario,
            respondida: respondida,
            esCorrecta: esCorrecta,
          );
        },
      ),
    );
  }
}

/// Widget para mostrar una respuesta individual.
class _ItemRespuesta extends StatefulWidget {
  final PreguntaEntity pregunta;
  final String? respuestaUsuario;
  final bool respondida;
  final bool esCorrecta;

  const _ItemRespuesta({
    required this.pregunta,
    required this.respuestaUsuario,
    required this.respondida,
    required this.esCorrecta,
  });

  @override
  State<_ItemRespuesta> createState() => _ItemRespuestaState();
}

class _ItemRespuestaState extends State<_ItemRespuesta> {
  bool expandido = false;

  OpcionEntity? _obtenerOpcionSeleccionada() {
    return widget.pregunta.opciones.firstWhere(
      (opcion) => opcion.texto == widget.respuestaUsuario,
      orElse: () => const OpcionEntity(texto: '', esCorrecta: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expandido = !expandido;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado con pregunta y estado
            Row(
              children: [
                // Número de pregunta
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        widget.respondida
                            ? (widget.esCorrecta
                                ? const Color(0xFF22C55E)
                                : const Color(0xFFEF4444))
                            : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      '${widget.pregunta.orden}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Pregunta (truncada si es larga)
                Expanded(
                  child: Text(
                    widget.pregunta.texto,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Icono de estado
                Icon(
                  _getIconoPorEstado(),
                  color: _getColorPorEstado(),
                  size: 18,
                ),
              ],
            ),

            // Si está expandido, mostramos detalles
            if (expandido) ...[
              const SizedBox(height: 12),

              // Estado de la respuesta
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: _getColorPorEstado().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  _getTextoEstado(),
                  style: TextStyle(
                    color: _getColorPorEstado(),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Respuesta del usuario
              if (widget.respondida) ...[
                const SizedBox(height: 8),
                Text(
                  'Tu respuesta: ${widget.respuestaUsuario}',
                  style: TextStyle(
                    color:
                        widget.esCorrecta
                            ? const Color(0xFF22C55E)
                            : const Color(0xFFEF4444),
                    fontSize: 14,
                  ),
                ),

                // Explicación de la opción seleccionada
                if (_obtenerOpcionSeleccionada()?.explicacion != null &&
                    _obtenerOpcionSeleccionada()!.explicacion!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Explicación de tu respuesta:\n${_obtenerOpcionSeleccionada()!.esCorrecta}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
              // Respuesta incorrecta explicacion de su respuesta (solo si respondió incorrectamente

              // Respuesta correcta (solo si respondió incorrectamente)
              if (widget.respondida && !widget.esCorrecta) ...[
                const SizedBox(height: 8),
                Text(
                  'Respuesta correcta: ${_obtenerRespuestaCorrecta()}',
                  style: const TextStyle(
                    color: Color(0xFF22C55E),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

              // Explicación
              if (widget.pregunta.explicacion.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Explicación: ${widget.pregunta.explicacion}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  /// Devuelve el ícono según el estado de la respuesta.
  IconData _getIconoPorEstado() {
    if (!widget.respondida) {
      return Icons.help_outline;
    } else if (widget.esCorrecta) {
      return Icons.check_circle_outline;
    } else {
      return Icons.cancel_outlined;
    }
  }

  /// Devuelve el color según el estado de la respuesta.
  Color _getColorPorEstado() {
    if (!widget.respondida) {
      return Colors.grey;
    } else if (widget.esCorrecta) {
      return const Color(0xFF22C55E);
    } else {
      return const Color(0xFFEF4444);
    }
  }

  /// Devuelve un texto descriptivo del estado.
  String _getTextoEstado() {
    if (!widget.respondida) {
      return 'SIN RESPONDER';
    } else if (widget.esCorrecta) {
      return 'CORRECTA';
    } else {
      return 'INCORRECTA';
    }
  }

  /// Obtiene la respuesta correcta de la pregunta.
  String _obtenerRespuestaCorrecta() {
    final opcionCorrecta = widget.pregunta.opciones.firstWhere(
      (opcion) => opcion.esCorrecta,
      orElse:
          () => const OpcionEntity(texto: 'No disponible', esCorrecta: false),
    );
    return opcionCorrecta.texto;
  }
}
