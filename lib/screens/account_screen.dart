import 'package:flutter/material.dart';
import 'dart:async';
import 'package:undo_test/components/top_config_widget.dart';
import 'package:undo_test/constants.dart';
import 'package:undo_test/screens/sign_up_screen.dart';
import 'package:undo_test/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final auth = FirebaseAuth.instance;
  bool _isUserSignedIn = false;

  FutureOr checkForUser(dynamic value) {
    setState(() {
      // SHEEEESH!!!
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (auth.currentUser != null) {
      _isUserSignedIn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
            top: 10.0, left: 24.0, right: 24.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTopBar(
              onAddIconTap: () {},
              header: 'ACCOUNT',
              bigTitle: _isUserSignedIn
                  ? 'Welcome ${auth.currentUser?.email}'
                  : 'You are not logged in.',
              smallTitle: 'All your account settings.',
              icon: Icons.wb_sunny,
              onIconTap: () {
                print('test account');
              },
              addIconMood: false,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kMyRedColor),
                      ),
                      child: Text('Sign In'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        ).then(checkForUser);
                      },
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kmyBlueColor),
                      ),
                      child: Text('Sign Up'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
