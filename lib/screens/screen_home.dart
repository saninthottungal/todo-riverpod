import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  onPressed: () {},
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Add"),
                    icon: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    )),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text("data"),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
