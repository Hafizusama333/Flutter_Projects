// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screen/Home/Home.dart';
import 'package:firebase_project/screen/signup/signup.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all the fields!")),
      );
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => HomeScreen()));
        }
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User not found! Please sign up.")),
          );
        } else if (ex.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Incorrect password!")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("An error occurred: ${ex.message}")),
          );
        }
        log(ex.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration:
                        const InputDecoration(labelText: "Email Address"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      login();
                    },
                    color: Colors.blue,
                    child: const Text("Log In"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Create an Account"),
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
