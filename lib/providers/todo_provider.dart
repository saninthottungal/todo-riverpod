import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo_model.dart';

final todoProvider =
    AsyncNotifierProvider<TodoNotifier, List<TodoModel>>(TodoNotifier.new);

class TodoNotifier extends AsyncNotifier<List<TodoModel>> {
  @override
  Future<List<TodoModel>> build() async {
    final box = await Hive.openBox<TodoModel>('todos');
    final todos = box.values.toList();
    return todos;
  }

  //add todo
  Future<void> add(String task) async {}

  //remove Todo
  void remove(String uid) {}

  //toggle todo status

  void toggleTodoStatus(TodoModel todo) {}
}
