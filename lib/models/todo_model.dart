import 'package:uuid/uuid.dart';

class TodoModel {
  final String uid;
  final String task;
  final bool isCompleted;

  TodoModel({
    required this.task,
    this.isCompleted = false,
  }) : uid = const Uuid().v4();

  TodoModel copyWith({String? task, bool? isCompleted}) {
    return TodoModel(
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
