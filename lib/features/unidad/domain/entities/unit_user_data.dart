class UnidadProgreso {
  final String unidadId;
  final String courseId;
  final String userId;
  final bool isCompleted;
  final DateTime fechaCompletado;
  final String title;

  UnidadProgreso({
    required this.unidadId,
    required this.userId,
    required this.courseId,
    required this.isCompleted,
    required this.fechaCompletado,
    required this.title,
  });
}
