import 'package:flutter/material.dart';
import 'form.dart';
import 'appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      title: 'Home',
      body: Stack(
        children: <Widget>[
          // Top-left color
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.transparent],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(screenWidth * 0.4),
                ),
              ),
            ),
          ),
          // Top-right color
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.red, Colors.transparent],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.4),
                ),
              ),
            ),
          ),
          // Bottom-left color
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.yellow, Colors.transparent],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(screenWidth * 0.4),
                ),
              ),
            ),
          ),
          // Bottom-right color
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [Colors.green, Colors.transparent],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.4),
                ),
              ),
            ),
          ),
          // Center content
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: screenWidth * 0.8,
              height: screenHeight * 0.8,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/connect.png',
                    width: 150,
                  ),
                  SizedBox(height: 20),
                  CircularButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Connect with us for development',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CircularButton({required this.onPressed});

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
        widget.onPressed(); // Call the onPressed callback
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isTapped ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            "Let's Connect",
            style: TextStyle(
              color: isTapped ? Colors.white : Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
