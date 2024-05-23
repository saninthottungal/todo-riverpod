import 'package:uuid/uuid.dart';

class TodoModel {
  final String uid;
  final String task;
  final bool isCompleted;

  TodoModel({
    required this.task,
    this.isCompleted = false,
  }) : uid = const Uuid().v4();

  //named constructor

  TodoModel.withId({
    required this.uid,
    required this.task,
    this.isCompleted = false,
  });

  //copyWith

  TodoModel copyWith({String? task, bool? isCompleted}) {
    return TodoModel.withId(
      uid: uid,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  //fromMap

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel.withId(
      uid: map['uid'] ?? '',
      task: map['task'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'task': task,
      'isCompleted': isCompleted,
    };
  }
}
