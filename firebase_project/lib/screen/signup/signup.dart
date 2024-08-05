import 'dart:developer';
import 'package:firebase_project/screen/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || cPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the details!")),
      );
    } else if (password != cPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!")),
      );
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (ex) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${ex.message}")),
        );
        log(ex.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create an Account"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email Address"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true, // Hide password text
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: cPasswordController,
                  obscureText: true, // Hide password text
                  decoration:
                      const InputDecoration(labelText: "Confirm Password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text("Log in to the account"),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  onPressed: createAccount,
                  color: Colors.blue,
                  child: const Text("Create Account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
