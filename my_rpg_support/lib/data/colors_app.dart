import 'package:flutter/material.dart';

class ColorsApp{

  ColorsApp();

  static const Color primaryColor = Color.fromRGBO(12,13,26,20);
  static const Color secundaryColor = Color.fromRGBO(0,121,107,20);
  static const Color terciaryColor = Color.fromRGBO(8,8,16,50);

  static const Color primaryWhiteColor = Color.fromRGBO(250,250,250,50);

  static const Color errorColor = Color.fromRGBO(255,5,15,50);

  static const Color pointGoodColor = Colors.green;
  static const Color pointOkColor = Colors.yellow;
  static const Color pointBadColor = Colors.red;

  static BoxDecoration buildDrawerBox({Color from, Color medio, Color medioDown, Color to, Alignment begin, Alignment end}){
    return BoxDecoration(
      gradient: LinearGradient(
        colors: medio != null ? medioDown != null ?
        [
          from,
          medio,
          medioDown,
          to,
        ] :
        [
          from,
          medio,
          to,
        ] :
        [
          from,
          to,
        ],
        begin: begin,
        end: end,
      ),
    );
  }

  static Widget buildDrawer({Color from, Color medio, Color to, Alignment begin, Alignment end}) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: medio != null ? [
          from,
          medio,
          to,
        ] :
        [
          from,
          to,
        ],
        begin: begin,
        end: end,
      ),
    ),
  );

}