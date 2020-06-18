import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_rpg_support/data/colors_app.dart';

class FloatButtomDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.secundaryColor,
      onPressed: (){
        _bottomOpem(context);
      },
      child: Icon(Icons.assignment, color: ColorsApp.primaryWhiteColor,),
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
              ListTile(
                leading: Icon(Icons.data_usage, color: ColorsApp.primaryWhiteColor,),
                title: Text(
                  '6 lados',
                  style: TextStyle(
                    color: ColorsApp.primaryWhiteColor,
                  ),
                ),
                onTap: () {
                  _jogarDado(6, context);
                }          
              ),
              ListTile(
                leading: Icon(Icons.data_usage, color: ColorsApp.primaryWhiteColor,),
                title: Text(
                  '12 lados',
                  style: TextStyle(
                    color: ColorsApp.primaryWhiteColor,
                  ),
                ),
                onTap: () {
                  _jogarDado(12, context);
                },          
              ),
              ListTile(
                leading: Icon(Icons.data_usage, color: ColorsApp.primaryWhiteColor,),
                title: Text(
                  '100 lados',
                  style: TextStyle(
                    color: ColorsApp.primaryWhiteColor,
                  ),
                ),
                onTap: () {
                  _jogarDado(100, context);
                },
              ),
            ],
          ),
        );
      }
    );
  }

}