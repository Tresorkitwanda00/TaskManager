class TaskModel {
  final String title;
  final String subtitle;
  final String description;
  final DateTime dateTime;
  final int priority;

  TaskModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.dateTime,
    required this.priority,
  });
  factory TaskModel.fromMap(Map<String, dynamic> data) {
    return TaskModel(
      title: data['title'],
      subtitle: data['subtitle'],
      description: data['description'],
      dateTime: data['dateTime'],
      priority: data['priority'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'priority': priority,
    };
  }
}
