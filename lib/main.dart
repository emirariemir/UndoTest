import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:undo_test/screens/account_screen.dart';
import 'package:undo_test/screens/home_page.dart';
import 'package:undo_test/screens/statics_screen.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  var screens = [
    Home(),
    StaticsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kMyGreenColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: screens[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 15.0,
          iconSize: 30.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kMyGreenColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          selectedItemColor: kDarkBlueColor,
          unselectedItemColor: Colors.black12,
          onTap: (i) => setState(() => _currentIndex = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Statics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
