// domain/entities/unit.dart
class Unit {
  final String id;
  final String title;
  final String content;
  final bool isComplete;
  final String courseId;
  final DateTime lastVisited;

  Unit({
    required this.id,
    required this.title,
    required this.content,
    required this.isComplete,
    required this.courseId,
    required this.lastVisited,
  });

  Unit copyWith({
    String? id,
    String? title,
    String? content,
    bool? isCompleted,
    String? courseId,
    DateTime? lastVisited,
  }) {
    return Unit(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isComplete: isCompleted ?? isComplete,
      courseId: courseId ?? this.courseId,
      lastVisited: lastVisited ?? this.lastVisited,
    );
  }
}
