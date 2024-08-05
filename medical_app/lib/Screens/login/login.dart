import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';
import '../otp/otp.dart'; // Ensure you have this screen defined

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Image.asset('assets/logo.png', height: 60),
            ),
            SizedBox(height: 20),
            Text(
              'Deazi Medical',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Please Enter your Mobile Number to Login/Sign Up',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: '+91 ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: '9265614292',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => OtpScr()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryclr,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'CONTINUE',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
