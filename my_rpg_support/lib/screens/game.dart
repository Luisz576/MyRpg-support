import 'package:flutter/material.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/data/database.dart';
import 'package:my_rpg/tabs/tab_equipe.dart';
import 'package:my_rpg/tabs/tab_mapa.dart';
import 'package:my_rpg/tabs/tab_missoes.dart';
import 'package:my_rpg/widget/float_buttom_dados.dart';

class Game extends StatefulWidget {
  final String _codeg;
  final String _playerId;
  Game(this._codeg, this._playerId);

  @override
  _GameState createState() => _GameState(_codeg, _playerId);
}

class _GameState extends State<Game> {
  int _selectedIndex = 0;
  Future<bool> _connection;
  final String _codeg;
  final String _playerId;
  _GameState(this._codeg, this._playerId);

  List<Widget> tabs;

  @override
  void initState() => setState((){
      super.initState();
      _connection = DataBase.tryConnect(_codeg, _playerId);
      tabs = [
        TabEquipe(_codeg, _playerId),
        TabMissoes(_codeg,_playerId),
        TabMapa(_codeg, _playerId),
      ];
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Game:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "${widget._codeg}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor,
            ),
          ),
          FutureBuilder<bool>(
            future: _connection,
            builder: (context, snapshot){

              if(snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                if(snapshot.data)
                  return tabs[_selectedIndex];
                else
                  return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Não foi possível conectar-se ao servidor!",
                          style: TextStyle(
                            color: ColorsApp.errorColor,
                          ),
                        ),
                        //CRIAR BOTÃO
                      ],
                    ),
                  ),
                ],
              );

            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsApp.primaryColor,
        elevation: 2.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: _selectedIndex == 0 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,),
            // ignore: deprecated_member_use
            title: Text("Equipe",
              style: TextStyle(
                color: _selectedIndex == 0 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, color: _selectedIndex == 1 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,),
            // ignore: deprecated_member_use
            title: Text("Missões",
              style: TextStyle(
                color: _selectedIndex == 1 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: _selectedIndex == 2 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,),
            // ignore: deprecated_member_use
            title: Text("Mapa",
              style: TextStyle(
                color: _selectedIndex == 2 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatButtomDados(),
    );
  }
}