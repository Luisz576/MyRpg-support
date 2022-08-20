import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/models/room_data.dart';
import 'package:myrpg_support/screens/home_screen.dart';
import 'package:myrpg_support/services/api.dart';
import 'package:myrpg_support/widgets/character_tile.dart';

class CharactersTab extends StatefulWidget {
  const CharactersTab({Key? key}) : super(key: key);

  @override
  State<CharactersTab> createState() => _CharactersTabState();
}

class _CharactersTabState extends State<CharactersTab> {
  bool isLoading = true;
  RoomData roomData = RoomData.empty();

  @override
  void initState(){
    super.initState();
    _onRefresh();
  }

  disconnect(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
  }

  Future<void> _onRefresh() async{
    setState(() {
      isLoading = true;
    });
    RoomData? data = await Api.getRoomData();
    if(data == null){
      disconnect();
    }else{
      setState(() {
        isLoading = false;
        roomData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(
      child: CircularProgressIndicator(
        color: ColorsApp.secundaryColor,
      ),
    ) :
      RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: roomData.players.length,
          itemBuilder: (context, index) => CharacterTile(roomData.players[index]),
        ),
      );
  }
}