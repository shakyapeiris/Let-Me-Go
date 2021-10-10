import 'package:flutter/material.dart';
import 'package:mobile/screens/landing.dart';
import 'package:mobile/screens/userHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let me go',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Scaffold(
              body: Landing(),
            ),
        '/user': (BuildContext context) => UserHome()
      },
    );
  }
}
