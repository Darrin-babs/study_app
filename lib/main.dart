import 'package:flutter/material.dart';
import 'package:study_app/screens/home_screen.dart'; 

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}