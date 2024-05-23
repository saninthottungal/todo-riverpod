import 'package:uuid/uuid.dart';

class TodoModel {
  final String uid;
  final String task;
  final bool isCompleted;

  TodoModel({
    required this.task,
    this.isCompleted = false,
  }) : uid = const Uuid().v4();

  //copyWith

  TodoModel copyWith({String? task, bool? isCompleted}) {
    return TodoModel(
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  //fromMap

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      task: map['task'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'isCompleted': isCompleted,
    };
  }
}
