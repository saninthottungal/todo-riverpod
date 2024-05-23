import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final todoProvider = StreamNotifierProvider<FirebaseNotifer, List<TodoModel>>(
    FirebaseNotifer.new);

class FirebaseNotifer extends StreamNotifier<List<TodoModel>> {
  @override
  Stream<List<TodoModel>> build() {
    final instance = ref.read(firestoreProvider);

    return instance.collection('todos').snapshots().map((querySnapshot) =>
        querySnapshot.docs
            .map((documentSnapshot) =>
                TodoModel.fromMap(documentSnapshot.data()))
            .toList());
  }

  //adding

  Future<void> add(TodoModel todo) async {
    final instance = ref.read(firestoreProvider);
    await instance.collection('todos').doc(todo.uid).set(todo.toMap());
  }

  //remove

  Future<void> remove(TodoModel todo) async {
    final instance = ref.read(firestoreProvider);
    await instance.collection('todos').doc(todo.uid).delete();
  }

  //

  Future<void> toggleTodoStatus(TodoModel todo) async {
    final instance = ref.read(firestoreProvider);
    instance.collection('todos').doc(todo.uid).set(
          todo.copyWith(isCompleted: !todo.isCompleted).toMap(),
        );
  }
}
