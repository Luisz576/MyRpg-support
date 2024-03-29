import 'package:flutter/material.dart';

class ColorsApp{

  ColorsApp();

  static const Color primaryColor = Color.fromARGB(255, 9, 9, 19);
  static const Color secundaryColor = Color.fromRGBO(0,120,110,20);
  static const Color terciaryColor = Color.fromRGBO(8,8,16,50);
  static const Color secundaryTerciaryColor = Color.fromARGB(6, 13, 13, 24);

  static const Color primaryWhiteColor = Color.fromRGBO(250,250,250,50);
  static const Color secundaryWhiteColor = Color.fromRGBO(150,150,150,50);

  static const Color errorColor = Color.fromRGBO(255,5,15,50);
  static const Color missionFinished = Color.fromARGB(80,0,0,0);

  static const Color pointGoodColor = Colors.green;
  static const Color pointOkColor = Colors.yellow;
  static const Color pointBadColor = Colors.red;
  static const Color playerDie = Colors.grey;

  static BoxDecoration buildDrawerBox(Color from, Color? medio, Color? medioDown, Color to, Alignment begin, Alignment end){
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

  static Widget buildDrawer(Color from, Color? medio, Color to, Alignment begin, Alignment end) => Container(
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