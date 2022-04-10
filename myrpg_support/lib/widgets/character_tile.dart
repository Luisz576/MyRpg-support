import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/models/character.dart';
import 'package:myrpg_support/widgets/data_item.dart';

class CharacterTile extends StatefulWidget {
  final Character character;
  const CharacterTile(this.character, { Key? key }) : super(key: key);
  @override
  State<CharacterTile> createState() => _CharacterTileState();
}

class _CharacterTileState extends State<CharacterTile> {
  Color lifeColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    Character _player = widget.character;
    lifeColor = (_player.hpatual / _player.maxhp) >= 0.6 ? ColorsApp.pointGoodColor : (_player.hpatual / _player.maxhp) >= 0.25 ? ColorsApp.pointOkColor : (_player.hpatual / _player.maxhp) > 0 ? ColorsApp.pointBadColor : ColorsApp.playerDie;
    Color mpColor = (_player.mpatual / _player.maxmp) >= 0.6 ? ColorsApp.pointGoodColor : (_player.mpatual / _player.maxmp) >= 0.25 ? ColorsApp.pointOkColor : ColorsApp.pointBadColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Card(
      elevation: 4.0,
      child: InkWell(
        onTap: (){

        },
        child: Container(
          height: 270.0,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8.0,),
              Row(
                children: <Widget>[
                  const SizedBox(width: 16.0,),
                  Text(
                    _player.nome,
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
                    "${_player.classe} - ",
                    style: TextStyle(
                      color: lifeColor,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "${_player.gold} gold",
                    style: const TextStyle(
                      color: ColorsApp.pointOkColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              const SizedBox(height: 6.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Imagem
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SizedBox(
                      width: 75.0,
                      child: Image.network(
                        _player.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  //Info status
                  SizedBox(
                    width: 85.0,
                    child: _createColumn3Text(lifeColor,
                      mpColor,
                      ColorsApp.primaryWhiteColor,
                      "Hp: ${_player.hpatual} / ${_player.maxhp}",
                      "Mp: ${_player.mpatual} / ${_player.maxmp}",
                      "Lv: ${_player.lvl}"
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  SizedBox(
                    width: 55.0,
                    child: _createColumn3Text(ColorsApp.primaryWhiteColor,
                      ColorsApp.primaryWhiteColor,
                      ColorsApp.primaryWhiteColor,
                      "At: ${_player.at}",
                      "Def: ${_player.def}",
                      "Vel: ${_player.vel}"
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  SizedBox(
                    width: 60.0,
                    child: _createColumn2TextSkills(ColorsApp.primaryWhiteColor,
                      ColorsApp.primaryWhiteColor,
                      "Sort: ${_player.sort}",
                      "Inf: ${_player.influencia}",
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 28.0,
                            child: Image.asset(Character.getSkillImage(_player.skills[0]) != null ? Character.getSkillImage(_player.skills[0])! : Character.getSkillImageNull(), fit: BoxFit.fill,),
                          ),
                          const SizedBox(width: 4.0,),
                          SizedBox(
                            width: 28.0,
                            child: Image.asset(Character.getSkillImage(_player.skills[1]) != null ? Character.getSkillImage(_player.skills[1])! : Character.getSkillImageNull(), fit: BoxFit.fill,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Inventory
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: _previewInventoryPlayer(_player),
              ),
              //XP
              Expanded(
                child: Align(
                  child: LinearProgressIndicator(
                    value: (_player.xp / pow(_player.lvl, 2)),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
          decoration: ColorsApp.buildDrawerBox(ColorsApp.terciaryColor, ColorsApp.terciaryColor, ColorsApp.terciaryColor, lifeColor, Alignment.topCenter, Alignment.bottomCenter),
        ),
      ),
    ),
    );
  }

  Widget _createColumn3Text(Color color1, Color color2, Color color3, String t1, String t2, String t3){
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t1,
            style: TextStyle(
              fontSize: 14.0,
              color: color1,
            ),
          ),
        ),
        const SizedBox(height: 14.0,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t2,
            style: TextStyle(
              fontSize: 14.0,
              color: color2,
            ),
          ),
        ),
        const SizedBox(height: 14.0,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t3,
            style: TextStyle(
              fontSize: 14.0,
              color: color3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _createColumn2TextSkills(Color color1, Color color2, String t1, String t2, Row skills){
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t1,
            style: TextStyle(
              fontSize: 14.0,
              color: color1,
            ),
          ),
        ),
        const SizedBox(height: 14.0,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t2,
            style: TextStyle(
              fontSize: 14.0,
              color: color2,
            ),
          ),
        ),
        const SizedBox(height: 14.0,),
        Align(
          alignment: Alignment.centerLeft,
          child: skills,
        ),
      ],
    );
  }

  Widget _previewInventoryPlayer(Character _player){
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0,),
        Row(
          children: <Widget>[
            _buildPreviewItem(0, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(1, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(2, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(3, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(4, _player),
          ],
        ),
        const SizedBox(height: 8.0,),
        Row(
          children: <Widget>[
            _buildPreviewItem(5, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(6, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(7, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(8, _player),
            const SizedBox(width: 4.0),
            _buildPreviewItem(9, _player),
          ],
        ),
      ],
    );
  }

  Widget _buildPreviewItem(int index, Character _player){
    if(_player.getItem(index) == null){
      return Container();
    }
    return GestureDetector(
      onTap: (){
        if(_player.getItem(index)!.quantidade > 0){
          DataItem.infoItem(_player.getItem(index)!, context, lifeColor);
        }
      },
      child: SizedBox(
        width: 60.0,
        height: 60.0,
        child: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(DataItem.getSlotEmpty().image, fit: BoxFit.fill,),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(_player.getItem(index)!.image, fit: BoxFit.fill,),
                ),
              ],
            ),
            (_player.getItem(index)!.quantidade > 0) ? 
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: lifeColor,
                radius: 12.0,
                child: Text(
                  '${_player.getItem(index)!.quantidade}',
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ) :
            Container(),
          ],
        ),
      ),
    );
  }
}