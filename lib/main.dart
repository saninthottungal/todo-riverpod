import 'package:flutter/material.dart';
import 'package:todo_riverpod/screens/screen_home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 212, 91, 91))),
      title: 'Flutter Demo',
      home: const ScreenHome(),
    );
  }
}
