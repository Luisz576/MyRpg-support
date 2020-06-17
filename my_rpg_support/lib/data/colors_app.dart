import 'package:flutter/material.dart';

class ColorsApp{

  ColorsApp();

  static const Color primaryColor = Color.fromRGBO(12,13,26,20);
  static const Color secundaryColor = Color.fromRGBO(0,121,107,50);
  static const Color primaryWhiteColor = Color.fromRGBO(255,255,255,50);
  static const Color terciaryColor = Color.fromRGBO(8,8,16,50);
  static const Color errorColor = Color.fromRGBO(255,5,15,100);

  static Widget buildDrawer({Color from, Color to, Alignment begin, Alignment end}) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          from,
          to,
        ],
        begin: begin,
        end: end,
      ),
    ),
  );

}