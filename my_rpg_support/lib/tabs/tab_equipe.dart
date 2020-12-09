import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/data/database.dart';
import 'package:my_rpg/models/jogador.dart';
import 'package:my_rpg/tiles/personagem_tile.dart';

class TabEquipe extends StatefulWidget {
  final String _codeg;
  final String _playerId;
  TabEquipe(this._codeg, this._playerId);
  @override
  _TabEquipeState createState() => _TabEquipeState(_codeg, _playerId);
}

class _TabEquipeState extends State<TabEquipe> {
  final String _codeg;
  final String _playerId;
  Future<Map> _dataFutureGame;

  _TabEquipeState(this._codeg, this._playerId);

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dataFutureGame = DataBase.getRoomData(_codeg, _playerId);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: ColorsApp.terciaryColor,
      onRefresh: () async{
        setState(() {
          _dataFutureGame = DataBase.getRoomData(_codeg, _playerId);
        });
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<Map>(
              future: _dataFutureGame,
              builder: (context, snapshot){

                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.data != null){
                    if(snapshot.data['running'] != null ? snapshot.data['running'] : false)
                      return ListView(
                        children: _loadPlayers(snapshot.data['players']),
                      );
                  }else
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Text("A sala não está acessivel!", style: TextStyle(color: ColorsApp.errorColor),),
                          Text("Contate o admin da sala!", style: TextStyle(color: ColorsApp.errorColor)),
                        ],
                      ),
                    );
                }
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text("Ocorreu um erro ao se conectar à sala!", style: TextStyle(color: ColorsApp.errorColor),),
                      Text("Contate o admin da sala!", style: TextStyle(color: ColorsApp.errorColor),),
                    ],
                  ),
                );
                

              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _loadPlayers(List<dynamic> dataPlayers){
    List<Widget> w = new List<Widget>();
    if(dataPlayers.length > 0){
      dataPlayers.sort((a, b){
        return (a['playerId'] == _playerId) ? 0 : (b['playerId'] == _playerId) ? 1 : -1;
      });
      dataPlayers.forEach((value) {
        w.add(PersonagemTile(Jogador.fromMap(value)));
      });
    }else
      w.add(Text("Não há players na sala!!", style: TextStyle(color: ColorsApp.secundaryWhiteColor),));
    return w;
  }

}