import 'package:myrpg_support/models/connection.dart';

class Api{

  static const urlBase = "http://192.168.56.1:3030";

  static Future<Connection?> connectToRoom(String roomCode) async{
    Connection connection = Connection(roomCode);
    final response = await connection.get("/hasroom");
    print(response);
    if(false){
      return connection;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getRoomData(Connection connection) async{
    final responsePlayers = await connection.get("/players");
    print(responsePlayers);
    if(false){
      return {};
    }
    return null;
  }

}