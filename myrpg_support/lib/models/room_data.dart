import 'package:myrpg_support/data/triple.dart';
import 'package:myrpg_support/models/character.dart';
import 'package:myrpg_support/models/mission.dart';

class RoomData{

  List<Character> players = [];
  List<Mission> missions = [];
  String? map;

  RoomData(this.players, this.missions);

  loadDataFromTriple(Triple<Map, Map, String> data){
    loadData(data.a, data.b, data.c);
  }
  loadData(Map playersData, Map missionsData, String map){
    players = [];
    missions = [];
    for(int i = 0; i < playersData["players_amount"]; i++){
      players.add(Character.fromMap(playersData["players"][i]));
    }
    for(int i = 0; i < missionsData["missions_amount"]; i++){
      missions.add(Mission.fromMap(missionsData["missions"][i]));
    }
    missions.sort((a, b){
      if(a.completed! || (!a.principal! && b.principal!)){
        return 1;
      }
      if(a.principal! && !a.completed! && !b.principal!){
        return -1;
      }
      return 0;
    });
    this.map = map;
  }

  RoomData.empty();

}