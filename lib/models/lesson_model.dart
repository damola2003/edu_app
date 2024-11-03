class Lesson {
  final int? id;
  final String title;
  final String content;
  final String subject;

  Lesson({
    this.id,
    required this.title,
    required this.content,
    required this.subject,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      subject: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'subject': subject,
    };
  }
}
