import 'package:flutter/material.dart';
import 'api_Service.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    emailController.text = 'eve.holt@reqres.in';
    passwordController.text = 'pistol';
  }

  _signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    var response = await ApiService().register(email, password);
    if (response['token'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sign Up Successful!'),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sign Up Failed! ${response['error']}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
