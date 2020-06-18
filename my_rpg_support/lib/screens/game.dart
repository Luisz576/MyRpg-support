import 'package:flutter/material.dart';
import 'package:my_rpg_support/data/colors_app.dart';
import 'package:my_rpg_support/tabs/tab_equipe.dart';
import 'package:my_rpg_support/tabs/tab_mapa.dart';
import 'package:my_rpg_support/widget/float_buttom_dados.dart';

class Game extends StatefulWidget {
  final String _codeg;
  Game(this._codeg);

  @override
  _GameState createState() => _GameState(_codeg);
}

class _GameState extends State<Game> {
  int _selectedIndex = 0;
  final String _codeg;
  _GameState(this._codeg);

  List<Widget> tabs;

  @override
  void initState() => setState(() {
      super.initState();
      tabs = [
        TabEquipe(_codeg),
        TabMapa(_codeg),
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
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsApp.primaryColor,
        elevation: 2.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: _selectedIndex == 0 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,),
            title: Text(
              'Equipe',
              style: TextStyle(
                color: _selectedIndex == 0 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: _selectedIndex == 1 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,),
            title: Text(
              'Mapa',
              style: TextStyle(
                color: _selectedIndex == 1 ? ColorsApp.secundaryColor : ColorsApp.primaryWhiteColor,
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