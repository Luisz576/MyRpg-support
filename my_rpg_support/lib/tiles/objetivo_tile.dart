import 'package:flutter/material.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/models/objetivo.dart';

class ObjetivoTile extends StatefulWidget {
  final Objetivo obj;
  final bool principal;
  ObjetivoTile(this.obj, this.principal);
  @override
  _ObjetivoTileState createState() => _ObjetivoTileState(obj, principal);
}

class _ObjetivoTileState extends State<ObjetivoTile> {
  final Objetivo _obj;
  final bool _principal;
  _ObjetivoTileState(this._obj, this._principal);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.secundaryTerciaryColor,
      child: InkWell(
        child: Container(
          height: 60.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Container(
                    height: 20.0,
                    child: Text(_obj.objInfo,
                      style: TextStyle(
                        color: ColorsApp.secundaryWhiteColor,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                _obj.getProgress() < 1 ?
                LinearProgressIndicator(
                  value: _obj.getProgress(),
                ) :
                LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(_principal ? ColorsApp.pointGoodColor : ColorsApp.pointOkColor),
                  value: _obj.getProgress(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}