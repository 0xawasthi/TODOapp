import 'package:flutter/material.dart';
import 'package:todo/homepage.dart';
import 'package:todo/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {'/homepage': (context) => HomePage()},
    );
  }
}
