import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/models/todo_model.dart';
import '../providers/todo_provider.dart';

class ScreenHome extends ConsumerWidget {
  ScreenHome({super.key});

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: todoController,
              maxLength: 20,
              onSubmitted: (value) {
                if (value.trim().isEmpty) return;
                ref.read(todoProvider.notifier).add(TodoModel(task: value));
                todoController.clear();
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    todoController.clear();
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    if (todoController.text.trim().isEmpty) return;
                    ref
                        .read(todoProvider.notifier)
                        .add(TodoModel(task: todoController.text));
                    todoController.clear();
                  },
                  label: const Text("Add"),
                  icon: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            todos.when(
              data: (todos) {
                return todos.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Text("Try adding a todo!"),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                print(todos[index].uid);
                              },
                              leading: Checkbox(
                                  value: todos[index].isCompleted,
                                  onChanged: (value) {
                                    ref
                                        .read(todoProvider.notifier)
                                        .toggleTodoStatus(todos[index]);
                                  }),
                              title: Text(todos[index].task),
                              trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .read(todoProvider.notifier)
                                      .remove(todos[index]);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            );
                          },
                          itemCount: todos.length,
                        ),
                      );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

//96dc7724-b22f-439f-ac7d-a8917d2e43cd add
//787f0a38-ed54-4da3-8977-4c7441012b5b remove
//ca10fedd-1fd9-47c3-a99a-8c08a1d81f22