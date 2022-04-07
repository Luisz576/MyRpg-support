import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class InputCamp extends StatelessWidget {
  const InputCamp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text("Teste",
      style: TextStyle(
        color: ColorsApp.primaryWhiteColor
      ),
    );
  }
}