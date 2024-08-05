import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/To-do-app/to-do.dart';
import 'package:todo_app/To-do-app/todo_App.dart';
// Make sure this is the correct path to your provider file

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoScreen(),
    );
  }
}
