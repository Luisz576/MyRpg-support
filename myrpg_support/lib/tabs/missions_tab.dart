import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/models/room_data.dart';
import 'package:myrpg_support/widgets/mission_tile.dart';

class MissionsTab extends StatelessWidget {
  final RoomData roomData;

  const MissionsTab(this.roomData, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MissionTile(roomData.missions[index]),
      itemCount: roomData.missions.length,
    );
  }
}