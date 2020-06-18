import 'package:flutter/material.dart';
import 'package:my_rpg_support/data/colors_app.dart';
import 'package:my_rpg_support/models/jogador.dart';

class PersonagemTile extends StatefulWidget {
  final Jogador _player;
  PersonagemTile(this._player);
  @override
  _PersonagemTileState createState() => _PersonagemTileState(_player);
}

class _PersonagemTileState extends State<PersonagemTile> {
  final Jogador _player;
  _PersonagemTileState(this._player);
  @override
  Widget build(BuildContext context) {
    Color lifeColor = (_player.hpatual / _player.maxhp) >= 0.6 ? ColorsApp.pointGoodColor : (_player.hpatual / _player.maxhp) >= 0.25 ? ColorsApp.pointOkColor : ColorsApp.pointBadColor;
    Color mpColor = (_player.mpatual / _player.maxmp) >= 0.6 ? ColorsApp.pointGoodColor : (_player.mpatual / _player.maxmp) >= 0.25 ? ColorsApp.pointOkColor : ColorsApp.pointBadColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Card(
      elevation: 4.0,
      child: InkWell(
        onTap: (){

        },
        child: Container(
          height: 250.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0,),
              Row(
                children: <Widget>[
                  SizedBox(width: 16.0,),
                  Text(
                    "${_player.nome}",
                    style: TextStyle(
                      color: lifeColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " - ${_player.raca} - ",
                    style: TextStyle(
                      color: lifeColor,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "${_player.classe}",
                    style: TextStyle(
                      color: lifeColor,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Imagem
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: SizedBox(
                      width: 80.0,
                      child: Image.network(
                        _player.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0,),
                  //Info status
                  _createColumn3Text(color1: lifeColor, color2: mpColor, color3: ColorsApp.primaryWhiteColor, t1: "HP: ${_player.hpatual} / ${_player.maxhp}", t2: "MP: ${_player.mpatual} / ${_player.maxmp}", t3: "Lv: ${_player.lvl}"),
                  _createColumn3Text(color1: lifeColor, color2: mpColor, color3: ColorsApp.primaryWhiteColor, t1: "HP: ${_player.at}", t2: "MP: ${_player.def}", t3: "${_player.vel}"),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: ColorsApp.terciaryColor,
          ),
        ),
      ),
    ),
    );
  }

  Widget _createColumn3Text({Color color1, Color color2, Color color3, String t1, String t2, String t3}){
    return Column(
      children: <Widget>[
        Text(
          t1,
          style: TextStyle(
            fontSize: 14.0,
            color: color1,
          ),
        ),
        SizedBox(height: 14.0,),
        Text(
          t2,
          style: TextStyle(
            fontSize: 14.0,
            color: color2,
          ),
        ),
        SizedBox(height: 14.0,),
        Text(
          t3,
          style: TextStyle(
            fontSize: 14.0,
            color: color3,
          ),
        ),
      ],
    );
  }

}