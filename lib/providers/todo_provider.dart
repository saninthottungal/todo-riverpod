import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_model.dart';

final todoProvider =
    NotifierProvider<TodoNotifier, List<TodoModel>>(TodoNotifier.new);

class TodoNotifier extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [];
  }

  void add(String task) {
    final todo = TodoModel(task: task);
    state = [todo, ...state];
  }

  void remove(String uid) {
    state.removeWhere((element) => element.uid == uid);
    state = [...state];
  }
}
