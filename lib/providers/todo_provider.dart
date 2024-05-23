import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final todoProvider = AsyncNotifierProvider<FirebaseNotifer, List<TodoModel>>(
    FirebaseNotifer.new);

class FirebaseNotifer extends AsyncNotifier<List<TodoModel>> {
  @override
  Future<List<TodoModel>> build() async {
    final instance = ref.read(firestoreProvider);
    final collection =
        await instance.collection('todos').get().then((value) => value.docs);
    return collection.map((e) => TodoModel.fromMap(e.data())).toList();
  }
}
