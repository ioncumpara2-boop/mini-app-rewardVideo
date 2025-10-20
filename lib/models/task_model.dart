class TaskModel {
  final String id;
  final String title;
  final String description;
  final int reward;
  final String icon;
  final bool isCompleted;
  final TaskType type;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.reward,
    required this.icon,
    this.isCompleted = false,
    required this.type,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    int? reward,
    String? icon,
    bool? isCompleted,
    TaskType? type,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      reward: reward ?? this.reward,
      icon: icon ?? this.icon,
      isCompleted: isCompleted ?? this.isCompleted,
      type: type ?? this.type,
    );
  }
}

enum TaskType {
  daily,
  weekly,
  special,
}

