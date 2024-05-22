import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_model.dart';

final todoProvider =
    NotifierProvider<TodoNotifier, List<TodoModel>>(TodoNotifier.new);

class TodoNotifier extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [];
  }

  //add todo
  void add(String task) => state = [TodoModel(task: task), ...state];

  //remove Todo
  void remove(String uid) {
    state.removeWhere((element) => element.uid == uid);
    state = [...state];
  }

  void toggleTodoStatus(TodoModel todo) {
    final newTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    state.removeWhere((element) => element.uid == todo.uid);
    state = [...state, newTodo];
  }
}
