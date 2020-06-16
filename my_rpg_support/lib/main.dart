import "package:flutter/material.dart";
import 'package:my_rpg_support/screens/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: "MyRpg Support",
    );
  }
}