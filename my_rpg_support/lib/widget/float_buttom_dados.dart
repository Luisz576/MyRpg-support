import 'dart:math';

import 'package:flutter/material.dart';

class FloatButtomDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        _bottomOpem(context);
      },
      child: Icon(Icons.assignment, color: Colors.white,),
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
          title: Text(
            "Você tirou:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0
            ),
          ),
         content: Text(
            "$_result",
            style: TextStyle(
              color: Colors.black,
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
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.data_usage),
                title: Text('6 lados'),
                onTap: () {
                  _jogarDado(6, context);
                }          
              ),
              ListTile(
                leading: Icon(Icons.data_usage),
                title: Text('12 lados'),
                onTap: () {
                  _jogarDado(12, context);
                },          
              ),
              ListTile(
                leading: Icon(Icons.data_usage),
                title: Text('100 lados'),
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