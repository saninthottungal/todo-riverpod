import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateProvider<List<String>>((ref) => []);

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
                      final a = [1, 2, 3];
                      final b = a;
                      b.add(4);
                      print(a == b);

                      print(a);
                      if (todoController.text.isEmpty) return;
                      ref.read(todoProvider.notifier).state = [
                        todoController.text,
                        ...todos
                      ];
                    },
                    label: const Text("Add"),
                    icon: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    )),
              ],
            ),
            todos.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text("Try adding a todo!"),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todos[index]),
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
