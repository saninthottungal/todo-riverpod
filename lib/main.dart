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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),
      ),
      title: 'Flutter Demo',
      home: ScreenHome(),
    );
  }
}
