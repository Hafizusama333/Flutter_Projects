import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'display_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/user_data': (context) => UserDataScreen(),
      },
    );
  }
}
