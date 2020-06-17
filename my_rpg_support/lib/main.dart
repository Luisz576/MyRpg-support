import "package:flutter/material.dart";
import 'package:my_rpg_support/screens/game.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Game("L576t3ste"),
      debugShowCheckedModeBanner: false,
      title: "MyRpg Support",
    );
  }
}