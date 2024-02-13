import 'package:flutter/material.dart';
import 'package:main_pro/home_screen.dart';
import 'constants.dart';
//import 'login_screen.dart';

void main() {
  runApp(const InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
