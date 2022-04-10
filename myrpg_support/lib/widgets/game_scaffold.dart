import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class GameScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? bottomNavigationBar;
  const GameScaffold({ Key? key, required this.title, required this.child, this.bottomNavigationBar }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorsApp.secundaryTerciaryColor,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}