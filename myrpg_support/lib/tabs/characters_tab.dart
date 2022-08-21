import 'package:flutter/material.dart';
import 'package:myrpg_support/models/room_data.dart';
import 'package:myrpg_support/widgets/character_tile.dart';

class CharactersTab extends StatelessWidget {
  final RoomData roomData;

  const CharactersTab(this.roomData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: roomData.players.length,
      itemBuilder: (context, index) => CharacterTile(roomData.players[index]),
    );
  }
}