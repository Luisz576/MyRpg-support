import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class InputCamp extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const InputCamp(this.controller, { Key? key, this.hintText = "" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: ColorsApp.primaryWhiteColor,
      ),
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        hintStyle: const TextStyle(fontSize: 20.0, color: ColorsApp.secundaryWhiteColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.secundaryWhiteColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.primaryWhiteColor),
        ),
      ),
      maxLength: 18,
    );
  }
}