import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Completelogin extends StatefulWidget {
  const Completelogin({super.key});

  @override
  State<Completelogin> createState() => _CompleteloginState();
}

class _CompleteloginState extends State<Completelogin> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainMenu"),
      ),
      body: Center(
          child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
          TextFormField(
            controller: _telephoneController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your tel',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final uid = FirebaseAuth.instance.currentUser!.uid;
                CollectionReference users =
                    FirebaseFirestore.instance.collection("Users");
                users.doc(uid).set({
                  "name": _usernameController.text,
                  "telephone": _telephoneController.text,
                });
              },
              child: const Text("save"))
        ],
      )),
    );
  }
}
