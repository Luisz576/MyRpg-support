import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/services/api.dart';
import 'package:myrpg_support/tabs/characters_tab.dart';
import 'package:myrpg_support/tabs/map_tab.dart';
import 'package:myrpg_support/tabs/missions_tab.dart';
import 'package:myrpg_support/widgets/game_scaffold.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({ Key? key }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _tabIndex = 0;

  static const _tabs = [
    CharactersTab(),
    MissionsTab(),
    MapTab()
  ];

  void _onItemTapped(index){
    setState((){
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      title: "Room: ${Api.getRoomCode()}",
      child: _tabs.elementAt(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsApp.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Characters"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt), 
            label: "Missions"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map), 
            label: "Map"
          )
        ],
        currentIndex: _tabIndex,
        selectedItemColor: ColorsApp.secundaryColor,
        unselectedItemColor: ColorsApp.primaryWhiteColor,
        onTap: _onItemTapped,
      ),
    );
  }
}