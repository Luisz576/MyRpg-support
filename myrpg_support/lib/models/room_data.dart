import 'package:myrpg_support/models/character.dart';
import 'package:myrpg_support/models/mission.dart';

class RoomData{

  List<Character> players = [];
  List<Mission> missions = [];

  RoomData(this.players, this.missions);

  RoomData.fromMap(Map playersData, Map missionsData){
    for(int i = 0; i < playersData["players_amount"]; i++){
      players.add(Character.fromMap(playersData["players"][i]));
    }
  }

  RoomData.empty();

}