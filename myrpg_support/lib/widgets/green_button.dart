import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class GreenButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  // ignore: prefer_const_constructors_in_immutables
  GreenButton(this.text, { Key? key, this.onPressed }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return ColorsApp.secundaryColor.withOpacity(0.8);
          }
          return ColorsApp.secundaryColor;
        })
      ),
      child: Text(text,
        style: const TextStyle(
          color: ColorsApp.primaryWhiteColor,
          fontSize: 20.0
        ),
      )
    );
  }
}