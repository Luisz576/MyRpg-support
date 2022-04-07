import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/services/api.dart';
import 'package:myrpg_support/widgets/input_camp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: const Text("My RPG Support",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorsApp.secundaryTerciaryColor,
      body: Column(
        children: const [
          InputCamp(),
          InputCamp()
        ],
      ),
    );
  }
}