import 'package:flutter/material.dart';
import 'package:myrpg_support/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyRPG Support',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}