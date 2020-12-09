import 'package:flutter/material.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/data/data_item.dart';
import 'package:my_rpg/models/item.dart';
import 'package:my_rpg/models/missao.dart';
import 'package:my_rpg/models/objetivo.dart';
import 'package:my_rpg/tiles/objetivo_tile.dart';

class MissaoTile extends StatefulWidget {
  final Missao _data;
  MissaoTile(this._data);
  @override
  _MissaoTileState createState() => _MissaoTileState(_data);
}

class _MissaoTileState extends State<MissaoTile> {
  final Missao _data;
  _MissaoTileState(this._data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Card(
        elevation: 4.0,
        child: InkWell(
          onTap: (){

          },
          child: Container(
            height: ((_data.recompensaType == 1 ? 245.0 : 200.0) + _getMoreSizeObjs(_data.objs)),
            color: ColorsApp.terciaryColor,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _data.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.0,
                            color: _data.principal ? ColorsApp.pointGoodColor : ColorsApp.pointOkColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      Container(
                        height: 90.0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _data.descricao,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: ColorsApp.secundaryWhiteColor
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: Column(
                            children: _loadObjs(_data.objs),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      _data.recompensaType == 1 ?
                      _getRecompensaSlot(DataItem.getItem(_data.recompensa, _data.quantItemRecive)) :
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Gold: ${_data.recompensa}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: ColorsApp.pointOkColor
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _data.fail || _data.completed ?
                Container(
                  color: ColorsApp.missionFinished,
                ) :
                Container(),
                //// Division ////
                _data.fail ?
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("images/missions/fail.png", scale: 7.0,),
                ) : _data.completed ?
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("images/missions/completed.png", scale: 1.5,),
                ) :
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getRecompensaSlot(Item item){
    return GestureDetector(
      onTap: (){
        if(item.quantidade > 0){
          DataItem.infoItem(item, context);
        }
      },
      child: SizedBox(
        width: 80.0,
        height: 80.0,
        child: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(DataItem.getSlotEmpty().image, fit: BoxFit.fill,),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(item.image, fit: BoxFit.fill,),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: ColorsApp.pointGoodColor,
                radius: 12.0,
                child: Text(
                  '${item.quantidade}',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double _getMoreSizeObjs(objs){
    return (60.0 * objs.length);
  }

  List<Widget> _loadObjs(objs){
    List<Widget> w = new List<Widget>();
    objs.forEach((value){
      w.add(ObjetivoTile(Objetivo.fromMap(value), _data.principal));
    });
    return w;
  }

}