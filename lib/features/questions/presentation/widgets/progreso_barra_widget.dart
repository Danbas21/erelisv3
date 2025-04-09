import 'package:flutter/material.dart';

/// Widget que muestra una barra de progreso del examen.
class ProgresoBarraWidget extends StatelessWidget {
  final int total;
  final int completadas;
  final int indicePreguntaActual;

  const ProgresoBarraWidget({
    super.key,
    required this.total,
    required this.completadas,
    required this.indicePreguntaActual,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Color(0xFF172A52),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          // Info de progreso
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progreso: $completadas/$total',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${(completadas / total * 100).toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 6.0),

          // Barra de progreso
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: LinearProgressIndicator(
              value: completadas / total,
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF3B82F6),
              ),
              minHeight: 8.0,
            ),
          ),
          const SizedBox(height: 8.0),

          // Indicadores de preguntas
          SizedBox(
            height: 20.0,
            child:
                total <=
                        20 // Solo mostramos los indicadores si hay 20 o menos preguntas
                    ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: total,
                      itemBuilder: (context, index) {
                        // Determinamos el estado del indicador
                        final bool esPreguntaActual =
                            index == indicePreguntaActual;
                        final bool completada = _esPreguntaCompletada(index);

                        return Container(
                          width: 20.0,
                          height: 20.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getColorIndicador(
                              esPreguntaActual,
                              completada,
                            ),
                            border:
                                esPreguntaActual
                                    ? Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    )
                                    : null,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color:
                                    esPreguntaActual
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    : const Center(
                      child: Text(
                        'Demasiadas preguntas para mostrar indicadores',
                        style: TextStyle(color: Colors.white70, fontSize: 12.0),
                      ),
                    ),
          ),
        ],
      ),
    );
  }

  /// Determina si una pregunta está completada.
  bool _esPreguntaCompletada(int index) {
    // Si el índice es menor al número de completadas, está completada
    // Esta lógica podría mejorar con información de qué preguntas específicas están completadas
    return index < completadas;
  }

  /// Devuelve el color para el indicador según su estado.
  Color _getColorIndicador(bool esPreguntaActual, bool completada) {
    if (esPreguntaActual) {
      return const Color(0xFF3B82F6); // Azul para pregunta actual
    } else if (completada) {
      return const Color(0xFF22C55E); // Verde para completadas
    } else {
      return Colors.white.withValues(alpha: 0.3); // Gris para pendientes
    }
  }
}
