import 'package:myrpg_support/models/connection.dart';

class Api{

  static const urlBase = "http://192.168.56.1:3030";
  static String _room = "";
  static Connection? _connection;

  static Future<bool> connectToRoom(String roomCode) async{
    _room = roomCode;
    Connection connection = Connection(roomCode);
    return true;
    final response = await connection.get("/hasroom");
    print(response);
    if(false){
      return true;
    }
    return false;
  }

  static String getRoomCode(){
    return _room;
  }

  static Future<Map<String, dynamic>?> getRoomData() async{
    if(_connection != null){
      final responsePlayers = await _connection!.get("/players");
      print(responsePlayers);
      if(false){
        return {};
      }
    }
    return null;
  }

}