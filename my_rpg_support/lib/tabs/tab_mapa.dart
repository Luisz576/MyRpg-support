import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/data/database.dart';

class TabMapa extends StatefulWidget {
  final String _codeg;
  final String _playerId;
  TabMapa(this._codeg, this._playerId);
  @override
  _TabMapaState createState() => _TabMapaState(_codeg, _playerId);
}

class _TabMapaState extends State<TabMapa> {
  final String _codeg;
  final String _playerId;
  _TabMapaState(this._codeg, this._playerId);
  Future<Map> _dataMapFuture;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dataMapFuture = DataBase.getRoomData(_codeg, _playerId);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: ColorsApp.terciaryColor,
      onRefresh: () async {
        setState(() {
          _dataMapFuture = DataBase.getRoomData(_codeg, _playerId);
        });
      },
      child: FutureBuilder(
        future: _dataMapFuture,
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.data['running'] != null ? snapshot.data['running'] : false)
                    return ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[ 
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Image.network(
                                    snapshot.data['map_game'] != null ? snapshot.data['map_game'] : "https://www.archgard.com/assets/upload_fallbacks/image_not_found-54bf2d65c203b1e48fea1951497d4f689907afe3037d02a02dcde5775746765c.png",
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: LinearProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null ? 
                                            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                            : null,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 16.0,),
                                  Text(
                                    "Mapa criado por ${snapshot.data['map_author'] != null ? snapshot.data['map_author'] : '???'}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: ColorsApp.primaryWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0,),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Localização atual:",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsApp.primaryWhiteColor,
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Text(
                                      snapshot.data['game_local'] != null ? snapshot.data['game_local'] : "???",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.primaryWhiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}