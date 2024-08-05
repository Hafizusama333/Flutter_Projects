import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login/login.dart'; // Ensure this path is correct

class WalkthroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/mobile.png', height: 300),
            SizedBox(height: 20),
            Text(
              'View and buy\nMedicine online',
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
                'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to the login screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.blue),
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the login screen
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Next',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
