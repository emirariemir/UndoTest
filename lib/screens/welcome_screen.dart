import 'package:flutter/material.dart';
import 'package:undo_test/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMyRedColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: const Text(
                  'Sign In!',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 3),
                    ),
                    hintText: 'Your E-mail',
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
              TextField(
                onEditingComplete: () async {
                  await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pop(context);
                },
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Your password',
                  hintStyle: TextStyle(color: Colors.white70),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
