import 'dart:convert';

import 'package:myrpg_support/models/connection.dart';

class Api{

  static const urlBase = "http://192.168.56.1:3030";
  static String _room = "";
  static Connection? _connection;

  static Future<bool> connectToRoom(String roomCode, Function callback) async{
    disconnect();
    _room = roomCode;
    Connection connection = Connection(roomCode);
    final response = await connection.get("/hasroom", args: {});
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      if(data["status"] == 200){
        connection.open(callback);
        return true;
      }
    }
    return false;
  }

  static bool isConnected(){
    if(_connection != null){
      return _connection!.isConnected();
    }
    return false;
  }

  static void disconnect(){
    if(_connection != null){
      _connection!.close();
    }
    _connection = null;
  }

  static String getRoomCode(){
    return _room;
  }

}