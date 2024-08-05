import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';
import 'dart:async'; // Importing dart:async for Timer
import '../tick/tick.dart'; // Ensure you have this screen defined

class OtpScr extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScr> {
  Timer? _timer;
  int _start = 59;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Text(
              'Enter the verify code',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We just sent you a verification code via phone\n+91 9265614292',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tick()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryclr,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                textStyle: TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'SUBMIT CODE',
                style: (TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'The verify code will expire in 00:${_start.toString().padLeft(2, '0')}',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Resend code logic
              },
              child: Text(
                'Resend Code',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
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
