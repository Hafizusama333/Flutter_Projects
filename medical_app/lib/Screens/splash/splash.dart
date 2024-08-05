import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Screens/walkthrough/walkthrough.dart';
import 'dart:async';

import 'package:medical_app/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WalkthroughScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryclr,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Deazi Medical',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
