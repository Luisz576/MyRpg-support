import 'package:flutter/material.dart';
import 'package:my_rpg/tabs/tab_join.dart';
import 'package:my_rpg/data/colors_app.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.primaryColor,
        title: Text(
          "MyRpg - Join",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor,
            ),
          ),
          TabJoin(),
        ],
      ),
    );
  }
}