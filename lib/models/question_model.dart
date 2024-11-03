// user_question.dart
class UserQuestion {
  final int? id;
  final int userId;
  final String questionText;
  final String? answerText;
  final DateTime createdAt;

  UserQuestion({
    required this.id,
    required this.userId,
    required this.questionText,
    required this.answerText,
    required this.createdAt,
  });

  factory UserQuestion.fromJson(Map<String, dynamic> json) {
    return UserQuestion(
      id: json['id'],
      userId: json['user'],
      questionText: json['question_text'],
      answerText: json['answer_text'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'question_text': questionText,
      'answer_text': answerText,
      'created_at': createdAt.toIso8601String(),
    };
  }
}