import 'package:flutter/material.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/data/database.dart';
import 'package:my_rpg/screens/game.dart';

class TabJoin extends StatefulWidget {
  @override
  _TabJoinState createState() => _TabJoinState();
}

class _TabJoinState extends State<TabJoin> {

  TextEditingController _codeController = TextEditingController();
  TextEditingController _playerIdController = TextEditingController();
  bool _codeNotOk = false;
  bool _tryingConnect = false;

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
            Padding(
              padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                  width: 300.0,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        style: TextStyle(
                          color: ColorsApp.primaryWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                        controller: _codeController,
                        decoration: InputDecoration(
                          hintText: 'Code',
                          counterText: "",
                          hintStyle: TextStyle(fontSize: 20.0, color: ColorsApp.secundaryWhiteColor),
                        ),
                        maxLength: 18,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color: ColorsApp.primaryWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                        controller: _playerIdController,
                        decoration: InputDecoration(
                          hintText: 'Player',
                          counterText: "",
                          hintStyle: TextStyle(fontSize: 20.0, color: ColorsApp.secundaryWhiteColor),
                        ),
                        maxLength: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: Material(
                elevation: 10.0,
                child: InkWell(
                  onTap: () async{
                    setState(() {
                      _tryingConnect = true;
                    });
                    String code = _codeController.text;
                    String playerId = _playerIdController.text;
                    if(code != null && playerId != null)
                      if(await DataBase.tryConnect(code, playerId))
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Game(code, playerId)),
                          );
                        else
                          _codeNotOk = true;
                      else
                        _codeNotOk = true;
                    setState(() {
                      _tryingConnect = false;
                    });
                  },
                  child: Container(
                    color: ColorsApp.secundaryColor,
                    alignment: Alignment.center,
                    width: 300.0,
                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Entrar",
                          style: TextStyle(
                            color: ColorsApp.primaryColor,
                            fontSize: 28.0,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorsApp.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0,),
            _codeNotOk ? Text(
              "Código de jogo ou/e player não encontrado(s)!",
              style: TextStyle(
                color: ColorsApp.errorColor,
                fontSize: 12.0,
              ),
            ) : Container(),
            SizedBox(height: 12.0),
            _tryingConnect ? Center(
              child: CircularProgressIndicator(),
            ) : Container(),
          ],
        ),
      ],
    );
  }
}