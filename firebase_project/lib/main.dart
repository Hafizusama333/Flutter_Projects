import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/screen/signup/signup.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // Ensure this file is correctly set up

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(), // Ensure this widget is imported correctly
    );
  }
}
