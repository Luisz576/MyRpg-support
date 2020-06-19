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
  Color lifeColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    lifeColor = (_player.hpatual / _player.maxhp) >= 0.6 ? ColorsApp.pointGoodColor : (_player.hpatual / _player.maxhp) >= 0.25 ? ColorsApp.pointOkColor : (_player.hpatual / _player.maxhp) > 0 ? ColorsApp.pointBadColor : ColorsApp.playerDie;
    Color mpColor = (_player.mpatual / _player.maxmp) >= 0.6 ? ColorsApp.pointGoodColor : (_player.mpatual / _player.maxmp) >= 0.25 ? ColorsApp.pointOkColor : ColorsApp.pointBadColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Card(
      elevation: 4.0,
      child: InkWell(
        onTap: (){

        },
        child: Container(
          height: 270.0,
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
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              SizedBox(height: 6.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Imagem
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: SizedBox(
                      width: 75.0,
                      child: Image.network(
                        _player.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0,),
                  //Info status
                  SizedBox(
                    width: 85.0,
                    child: _createColumn3Text(color1: lifeColor,
                      color2: mpColor,
                      color3: ColorsApp.primaryWhiteColor,
                      t1: "Hp: ${_player.hpatual} / ${_player.maxhp}",
                      t2: "Mp: ${_player.mpatual} / ${_player.maxmp}",
                      t3: "Lv: ${_player.lvl}"
                    ),
                  ),
                  SizedBox(width: 16.0,),
                  SizedBox(
                    width: 55.0,
                    child: _createColumn3Text(color1: ColorsApp.primaryWhiteColor,
                      color2: ColorsApp.primaryWhiteColor,
                      color3: ColorsApp.primaryWhiteColor,
                      t1: "At: ${_player.at}",
                      t2: "Def: ${_player.def}",
                      t3: "Vel: ${_player.vel}"
                    ),
                  ),
                  SizedBox(width: 16.0,),
                  SizedBox(
                    width: 60.0,
                    child: _createColumn2TextSkills(color1: ColorsApp.primaryWhiteColor,
                      color2: ColorsApp.primaryWhiteColor,
                      t1: "Sort: ${_player.sort}",
                      t2: "Inf: ${_player.influencia}",
                      skills: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 28.0,
                            child: Image.asset(Jogador.getSkillImage(_player.skills[0]) != null ? Jogador.getSkillImage(_player.skills[0]) : Jogador.getSkillImageNull(), fit: BoxFit.fill,),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          SizedBox(
                            width: 28.0,
                            child: Image.asset(Jogador.getSkillImage(_player.skills[1]) != null ? Jogador.getSkillImage(_player.skills[1]) : Jogador.getSkillImageNull(), fit: BoxFit.fill,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Inventory
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: _previewInventoryPlayer(),
              ),
              //XP
              Expanded(
                child: Align(
                  child: LinearProgressIndicator(
                    value: (_player.xp / 100),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
          decoration: ColorsApp.buildDrawerBox(begin: Alignment.topCenter, end: Alignment.bottomCenter, from: ColorsApp.terciaryColor, medio: ColorsApp.terciaryColor, medioDown: ColorsApp.terciaryColor, to: lifeColor),
        ),
      ),
    ),
    );
  }

  Widget _createColumn3Text({Color color1, Color color2, Color color3, String t1, String t2, String t3}){
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
        SizedBox(height: 14.0,),
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
        SizedBox(height: 14.0,),
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

  Widget _createColumn2TextSkills({Color color1, Color color2, String t1, String t2, Row skills}){
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
        SizedBox(height: 14.0,),
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
        SizedBox(height: 14.0,),
        Align(
          alignment: Alignment.centerLeft,
          child: skills,
        ),
      ],
    );
  }

  Widget _previewInventoryPlayer(){
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0,),
        Row(
          children: <Widget>[
            _buildPreviewItem(0),
            SizedBox(width: 4.0),
            _buildPreviewItem(1),
            SizedBox(width: 4.0),
            _buildPreviewItem(2),
            SizedBox(width: 4.0),
            _buildPreviewItem(3),
            SizedBox(width: 4.0),
            _buildPreviewItem(4),
          ],
        ),
        SizedBox(height: 8.0,),
        Row(
          children: <Widget>[
            _buildPreviewItem(5),
            SizedBox(width: 4.0),
            _buildPreviewItem(6),
            SizedBox(width: 4.0),
            _buildPreviewItem(7),
            SizedBox(width: 4.0),
            _buildPreviewItem(8),
            SizedBox(width: 4.0),
            _buildPreviewItem(9),
          ],
        ),
      ],
    );
  }

  Widget _buildPreviewItem(int index){
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: Stack(
        children: <Widget>[
          Image.asset(_player.getItem(index).image, fit: BoxFit.fill,),
          (_player.getItem(index).quantidade > 0) ? 
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: lifeColor,
              radius: 12.0,
              child: Text(
                '${_player.getItem(index).quantidade}',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ) :
          Container(),
        ],
      ),
    );
  }

  /*
  

    FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection('home').orderBy('pos').getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
              alignment: Alignment.center,
            ),
          );
        }else{
          return SliverStaggeredGrid.count(
            crossAxisCount: 2, //Grade
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            staggeredTiles: snapshot.data.documents.map((doc){
              return StaggeredTile.count(doc.data['x'], doc.data['y']);
            }).toList(),
            children: snapshot.data.documents.map((doc){
              return FadeInImage.memoryNetwork(
                placeholder: kTranparentImage.kTransparentImage,
                image: doc.data['image'],
                fit: BoxFit.cover,
              );
            }).toList(),
          );
        }
      }
    ),
  
  
  */

}