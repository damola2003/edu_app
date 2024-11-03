
import 'package:education_app/models/lesson_model.dart';

// progress.dart
class Progress {
  final int? id;
  final int? userId;
  final Lesson lesson;
  final double completionPercentage;
  final bool completionStatus;
  final DateTime? startedAt;
  final DateTime? completedAt;

  Progress({
    required this.id,
    required this.userId,
    required this.lesson,
    required this.completionPercentage,
    required this.completionStatus,
    required this.startedAt,
    required this.completedAt,
  });

  factory Progress.fromJson(Map<String, dynamic> json) {
    return Progress(
      id: json['id'],
      userId: json['user'],
      lesson: Lesson.fromJson(json['lesson']),
      completionPercentage: (json['completion_percentage'] as num).toDouble(),
      completionStatus: json['completion_status'],
      startedAt: json['started_at'] != null
          ? DateTime.parse(json['started_at'])
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'lesson': lesson.toJson(),
      'completion_percentage': completionPercentage,
      'completion_status': completionStatus,
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }
}
