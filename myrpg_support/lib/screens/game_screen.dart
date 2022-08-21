import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/data/triple.dart';
import 'package:myrpg_support/models/room_data.dart';
import 'package:myrpg_support/screens/home_screen.dart';
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
  RoomData roomData = RoomData.empty();
  bool isLoading = false;

  final _tabs = [];

  @override
  void initState(){
    super.initState();
    _tabs.add(CharactersTab(roomData));
    _tabs.add(MissionsTab(roomData));
    _tabs.add(const MapTab());
    _onRefresh();
  }

  disconnect(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
  }

  Future<void> _onRefresh() async{
    setState(() {
      isLoading = true;
    });
    Triple<Map, Map, String>? data = await Api.getRoomData();
    if(data == null){
      disconnect();
    }else{
      setState(() {
        isLoading = false;
        roomData.loadDataFromTriple(data);
      });
    }
  }

  void _onItemTapped(index){
    setState((){
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      title: "Room: ${Api.getRoomCode()}",
      child: isLoading ? const Center(
        child: CircularProgressIndicator(
          color: ColorsApp.secundaryColor,
        ),
      ) : RefreshIndicator(
        child: _tabs.elementAt(_tabIndex),
        onRefresh: _onRefresh,
      ),
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