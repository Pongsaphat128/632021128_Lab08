import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lab08/pages/completelogin.dart';
import 'package:lab08/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Center(
        child: Column(
          children: [
            GoogleAuthButton(
              onPressed: () {
                GoogleAuthService().signInWithGoogle().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Completelogin(),
                    ),
                  );
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  GoogleAuthService().googleSingOut();
                },
                child: Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
