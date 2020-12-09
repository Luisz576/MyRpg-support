import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/data/database.dart';
import 'package:my_rpg/models/missao.dart';
import 'package:my_rpg/tiles/missao_tile.dart';

class TabMissoes extends StatefulWidget {
  final String _codeg;
  final String _playerId;
  TabMissoes(this._codeg, this._playerId);
  @override
  _TabMissoesState createState() => _TabMissoesState(_codeg, _playerId);
}

class _TabMissoesState extends State<TabMissoes> {
  final String _codeg;
  final String _playerId;
  _TabMissoesState(this._codeg, this._playerId);
  Future<Map> _dataMissionFuture;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dataMissionFuture = DataBase.getRoomData(_codeg, _playerId);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          _dataMissionFuture = DataBase.getRoomData(_codeg, _playerId);
        });
      },
      backgroundColor: ColorsApp.terciaryColor,
      child: FutureBuilder(
        future: _dataMissionFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.data['running'] != null ? snapshot.data['running'] : false)
                    return ListView(
                      children: _loadMissions(snapshot.data['missions'])
                    );
                  else
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Text("A sala não está acessivel!", style: TextStyle(color: ColorsApp.errorColor),),
                          Text("Contate o admin da sala!", style: TextStyle(color: ColorsApp.errorColor)),
                        ],
                      ),
                    );
                }else{
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Text("Ocorreu um erro ao se conectar à sala!", style: TextStyle(color: ColorsApp.errorColor),),
                          Text("Contate o admin da sala!", style: TextStyle(color: ColorsApp.errorColor),),
                        ],
                      ),
                    );
                }
        },
      ),
    );
  }

  List<Widget> _loadMissions(List<dynamic> dataMissions){
      List<Widget> w = new List<Widget>();
      if(dataMissions.length > 0){
        dataMissions.sort((a, b){
          return !(a['completed'] || a['fail']) ? 0 : !(b['completed'] || b['fail']) ? 1 : -1;
          //return ((a['principal']) ? 0 : (b['principal']) ? 1 : -1);
        });
        dataMissions.forEach((value) {
          w.add(MissaoTile(Missao.fromMap(value)));
        });
      }else
        w.add(Text("Não há missões!", style: TextStyle(color: ColorsApp.secundaryWhiteColor),));
      return w;
  }

}