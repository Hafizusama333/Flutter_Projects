import 'package:flutter/material.dart';
import 'package:medical_app/Screens/category/categories.dart';
import 'package:medical_app/Screens/home/home_screen.dart';
import 'package:medical_app/Screens/navigator/navigation.dart';
import 'package:medical_app/Screens/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
