import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_rpg/data/colors_app.dart';

class FloatButtomDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.secundaryColor,
      onPressed: (){
        _bottomOpem(context);
      },
      child: Image.asset("images/dados/dados.png"),
    );
  }

  _jogarDado(int qnt, context){
    Navigator.of(context).pop();
    var r = new Random();
    int _result = r.nextInt(qnt) + 1;
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: ColorsApp.terciaryColor,
          title: Text(
            "Você tirou:",
            style: TextStyle(
              color: ColorsApp.primaryWhiteColor,
              fontSize: 8.0
            ),
          ),
         content: Text(
            "$_result",
            style: TextStyle(
              color: ColorsApp.primaryWhiteColor,
              fontSize: 48.0,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }
    );
  }

  _bottomOpem(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return Container(
          color: ColorsApp.terciaryColor,
          child: Wrap(
            children: <Widget>[
              _buildDado(4, "images/dados/4.png", context),
              _buildDado(6, "images/dados/6.png", context),
              _buildDado(8, "images/dados/8.png", context),
              _buildDado(12, "images/dados/12.png", context),
              _buildDado(20, "images/dados/20.png", context),
            ],
          ),
        );
      }
    );
  }

  Widget _buildDado(int lados, String image, context){
    return ListTile(
      leading: SizedBox(
        child: Image.asset(image, fit: BoxFit.fill,), 
        width: 50.0,
        height: 50.0,
      ),
      title: Text(
        '$lados lados',
        style: TextStyle(
          color: ColorsApp.primaryWhiteColor,
        ),
      ),
      onTap: () {
        _jogarDado(lados, context);
      }          
    );
  }

}