import 'package:flutter/material.dart';
import 'api_Service.dart';
import 'display_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    var response = await ApiService().login(email, password);
    if (response['token'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Successful!'),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserDataScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Failed! ${response['error']}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
