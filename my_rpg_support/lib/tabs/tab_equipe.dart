import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  //Personagens test e test2
  Map test = {
        "nome": "Luisz576",
        "raca": "Elfo",
        "classe": "Mago",
        "lvl": 1,
        "maxhp": 6,
        "maxmp": 6,
        "xp": 0,
        "at": 2,
        "def": 3,
        "vel": 4,
        "sort": 2,
        "influencia": 1,
        "hpatual": 6,
        "mpatual":6,
        "image": "https://yt3.ggpht.com/a/AATXAJzYiUqinCnhv1WhdG8Tvb3H3dOJW4n5B1hhmQ=s48-c-k-c0xffffffff-no-rj-mo",
        "skills": [1, 0],
        "inventory": {
            "0": {
              "id": 1,
              "quantidade": 10
            },
            "1": {
              "id": 0,
              "quantidade": 0
            },
            "2": {
              "id": 0,
              "quantidade": 0
            },
            "3": {
              "id": 0,
              "quantidade": 0
            },
            "4": {
              "id": 0,
              "quantidade": 0
            },
            "5": {
              "id": 0,
              "quantidade": 0
            },
            "6": {
              "id": 0,
              "quantidade": 0
            },
            "7": {
              "id": 0,
              "quantidade": 0
            },
            "8": {
              "id": 0,
              "quantidade": 0
            },
            "9": {
              "id": 0,
              "quantidade": 0
            },
            "10": {
              "id": 0,
              "quantidade": 0
            },
            "11": {
              "id": 0,
              "quantidade": 0
            },
            "12": {
              "id": 0,
              "quantidade": 0
            },
            "13": {
              "id": 0,
              "quantidade": 0
            },
            "14": {
              "id": 0,
              "quantidade": 0
            },
            "15": {
              "id": 0,
              "quantidade": 0
            },
            "16": {
              "id": 0,
              "quantidade": 0
            },
            "17": {
              "id": 0,
              "quantidade": 0
            },
            "18": {
              "id": 0,
              "quantidade": 0
            },
            "19": {
              "id": 0,
              "quantidade": 0
            },
            "20": {
              "id": 0,
              "quantidade": 0
            }
        }
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