import 'package:myrpg_support/models/connection.dart';

class Api{

  static const urlBase = "http://192.168.0.168";

  static Future<Connection?> connectToRoom(String roomCode) async{
    Connection connection = Connection(roomCode);
    final response = await connection.get("/hasroom", {"room": roomCode});
    print(response);
    if(false)
      return connection;
    return null;
  }

}