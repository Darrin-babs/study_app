import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}