import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Add"),
                icon: const Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Cancel"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const Text("data");
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
