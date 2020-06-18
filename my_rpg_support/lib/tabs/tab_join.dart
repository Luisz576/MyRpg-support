import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg_support/data/colors_app.dart';

class TabJoin extends StatefulWidget {
  @override
  _TabJoinState createState() => _TabJoinState();
}

class _TabJoinState extends State<TabJoin> {

  TextEditingController _codeController = TextEditingController();
  bool _codeNotOk = false;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
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
                      child: TextField(
                        style: TextStyle(
                          color: ColorsApp.primaryWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                        controller: _codeController,
                        decoration: InputDecoration(
                          hintText: 'Code',
                          counterText: "",
                          hintStyle: TextStyle(fontSize: 20.0, color: ColorsApp.primaryWhiteColor),
                        ),
                        maxLength: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Material(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _codeNotOk = true;
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
                  "Código de jogo não encontrado!",
                  style: TextStyle(
                    color: ColorsApp.errorColor,
                    fontSize: 12.0,
                  ),
                ) : Container(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}