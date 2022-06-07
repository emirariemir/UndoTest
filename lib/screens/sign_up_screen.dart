import 'package:flutter/material.dart';
import 'package:undo_test/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String email = '';
  String password = '';
  String passwordVerify = '';
  String name = '';
  String surname = '';

  Future<void> saveUserData() async {
    try {
      // Creating a User.
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('user created');
      // Signing in the User.
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print('user signed in');
      print(auth.currentUser?.uid);
      // Adding more information, i guess..?
      await firestore.collection('${auth.currentUser?.email}/').add({
        'name': name,
        'surname': surname,
        'email': email,
        'password': password,
      });
      print('user info saved');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kmyBlueColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: const Text(
                      'Sign Up!',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      onChanged: (value) {
                        name = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: inputDecoTextField('Your name'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      onChanged: (value) {
                        surname = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: inputDecoTextField('Your surname'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: inputDecoTextField('Your mail'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: inputDecoTextField('Your password'),
                    ),
                  ),
                  TextField(
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      saveUserData();
                    },
                    onChanged: (value) {
                      passwordVerify = value;
                    },
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: inputDecoTextField('Verify password'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
