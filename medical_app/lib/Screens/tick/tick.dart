import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Screens/home/home_screen.dart';
import 'package:medical_app/Screens/navigator/navigation.dart';
import 'package:medical_app/constants/colors.dart';

class Tick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/tick.png', height: 300),
            SizedBox(height: 20),
            Text(
              'Phone number verified',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Congratulations, your phone number has\nbeen verified. You can start using.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // Navigate to the home screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: primaryclr,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'continue',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
