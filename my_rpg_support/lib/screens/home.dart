import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyRpg Support",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}