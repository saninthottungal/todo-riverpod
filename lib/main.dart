import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/screens/screen_home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
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
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
            )),
      ),
      title: 'Flutter Demo',
      home: ScreenHome(),
    );
  }
}
