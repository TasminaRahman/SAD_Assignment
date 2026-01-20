class Note {
  final String id;
  final String userId;
  final String title;
  final String? content;
  final String? semester;
  final String? course;
  final List<String> tags;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.userId,
    required this.title,
    this.content,
    this.semester,
    this.course,
    required this.tags,
    required this.createdAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      semester: json['semester'],
      course: json['course'],
      tags: List<String>.from(json['tags'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'title': title,
      'content': content,
      'semester': semester,
      'course': course,
      'tags': tags,
    };
  }
}
