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
  Future<void> add(TodoModel todo) async {
    final box = await Hive.openBox<TodoModel>('todos');
    await box.add(todo);

    ref.invalidateSelf();
  }

  //remove Todo
  void remove(TodoModel todo) async {
    final box = await Hive.openBox<TodoModel>('todos');

    await box.delete(todo.key);
    ref.invalidateSelf();
  }

  //toggle todo status

  void toggleTodoStatus(TodoModel todo) async {
    final box = await Hive.openBox<TodoModel>('todos');
    final value =
        box.values.indexed.firstWhere((element) => element.$2.key == todo.key);
    box.putAt(value.$1, todo.copyWith(isCompleted: !todo.isCompleted));
    ref.invalidateSelf();
  }
}
