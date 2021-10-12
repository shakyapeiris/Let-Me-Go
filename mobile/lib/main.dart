import 'package:flutter/material.dart';
import 'package:mobile/screens/landing.dart';
import 'package:mobile/screens/userHome.dart';
import 'package:mobile/screens/ambulanceLogin.dart';
import 'package:mobile/screens/ambulanceRegister.dart';
import 'package:mobile/screens/ambulanceHome.dart';
import 'package:mobile/screens/ambulanceNavigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let me go',
      initialRoute: '/ambulance/register',
      routes: {
        '/': (BuildContext context) => Scaffold(
              body: Landing(),
            ),
        '/user': (BuildContext context) => UserHome(),
        '/ambulance/login': (BuildContext context) => AmbulanceLogin(),
        '/ambulance/register': (BuildContext context) => AmbulanceReg(),
        '/ambulance/home': (BuildContext context) => AmbulanceHome(),
        '/ambulance/nav': (BuildContext context) => AmbulanceNav(),
      },
    );
  }
}
