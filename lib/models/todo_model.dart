import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String task;
  @HiveField(2)
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
