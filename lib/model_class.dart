class TaskModel {
  final int id;
  final String title;
  final String description;
  final DateTime? createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      createdAt: jsonData['createdAt'] != null
          ? DateTime.parse(jsonData['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
