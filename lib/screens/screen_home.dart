import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: todoController,
              maxLength: 20,
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
                    if (todoController.text.isEmpty) return;
                    ref.read(todoProvider.notifier).add(todoController.text);
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
            todos.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Text("Try adding a todo!"),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todos[index].task),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(todoProvider.notifier)
                                  .remove(todos[index].uid);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                      itemCount: todos.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
