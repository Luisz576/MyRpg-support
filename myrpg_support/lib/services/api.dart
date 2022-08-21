import 'dart:convert';

import 'package:myrpg_support/data/triple.dart';
import 'package:myrpg_support/models/connection.dart';

class Api{

  static const urlBase = "http://192.168.0.105:5050";
  static Connection? _connection;

  static void connectToRoom(String roomCode, Function callback, Function failCallback, Function noConnectionCallback) async{
    _connection = Connection(roomCode);
    try{
      final response = await _connection!.get("/hasroom", args: {});
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        if(data["status"] == 200){
          callback();
        }else{
          _connection = null;
          failCallback();
        }
      }else{
        _connection = null;
        noConnectionCallback();
      }
    }catch(e){
      noConnectionCallback();
      return;
    }
  }

  static Future<Triple<Map, Map, String>?> getRoomData() async{
    if(isConnected()){
      try{
        final responsePlayers = await _connection!.get("/players", args: {});
        final responseMissions = await _connection!.get("/missions", args: {});
        if(responsePlayers.statusCode == 200 && responseMissions.statusCode == 200){
          final playersData = jsonDecode(responsePlayers.body);
          final missionsData = jsonDecode(responseMissions.body);
          if(playersData["status"] == 200 && missionsData["status"] == 200){
            // COMO SÓ TEM UM MAPA, NÃO IMPLEMENTEI NADA PARA MAPA
            return Triple(playersData, missionsData, "Sem mapa");
          }else{
            throw "No data was taken";
          }
      }else{
        throw "Connection error";
      }
      // ignore: empty_catches
      }catch(e){}
    }
    return null;
  }

  static bool isConnected(){
    return _connection != null;
  }

  static String getRoomCode(){
    if(_connection != null){
      return _connection!.getRoomCode();
    }
    return "";
  }

}