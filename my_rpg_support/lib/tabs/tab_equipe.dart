import 'package:flutter/material.dart';
import 'package:my_rpg_support/data/colors_app.dart';
import 'package:my_rpg_support/models/jogador.dart';
import 'package:my_rpg_support/tiles/personagem_tile.dart';

class TabEquipe extends StatefulWidget {
  final String _codeg;
  TabEquipe(this._codeg);
  @override
  _TabEquipeState createState() => _TabEquipeState(_codeg);
}

class _TabEquipeState extends State<TabEquipe> {
  final String _codeg;
  _TabEquipeState(this._codeg);
  Map test = {
      'nome': "Luisz576",
      'raca': "Elfo",
      'classe': "Mago",
      'lvl': 20,
      'maxhp': 100,
      'maxmp': 70,
      'at': 12,
      'def': 9,
      'vel': 7,
      'sort': 10,
      'hpatual': 55,
      'mpatual': 43,
      'image': "https://yt3.ggpht.com/a/AATXAJzYiUqinCnhv1WhdG8Tvb3H3dOJW4n5B1hhmQ=s48-c-k-c0xffffffff-no-rj-mo",
    };
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: ColorsApp.primaryColor,
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  PersonagemTile(Jogador.fromMap(test)),
                  PersonagemTile(Jogador.fromMap(test)),
                  PersonagemTile(Jogador.fromMap(test)),
                  PersonagemTile(Jogador.fromMap(test)),
                  PersonagemTile(Jogador.fromMap(test)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/*

StreamBuilder<QuerySnapshot>(
        stream: ,
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              List<DocumentSnapshot> documents = snapshot.data.documents.reversed.toList();
              return ListView.builder(
                reverse: true,
                itemCount: documents.length,
                itemBuilder: (context, index){
                  return PersonagemTile(Jogador.fromMap(documents[index].data));
                }
              );
          }
        },
      ),

*/