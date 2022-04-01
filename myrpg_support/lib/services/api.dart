import 'package:myrpg_support/models/connection.dart';

class Api{

  static const urlBase = "";

  Connection? connectToRoom(String roomCode){
    if(_canConnectToRoom(roomCode)){
      Connection connection = Connection(roomCode);
      return connection;
    }
    return null;
  }

  bool _canConnectToRoom(String roomCode){
    return false;
  }

}