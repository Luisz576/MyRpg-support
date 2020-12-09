import 'dart:convert';

import 'package:http/http.dart' as http;

class DataBase{

  static final _token = "213";

  //FUNCTIONS

  static Future<bool> tryConnect(String code, String playerId) async {
    String dataFromServer = await _getDataFromServer(code, playerId, false);
    if(dataFromServer != null)
      if(jsonDecode(dataFromServer)['error'] == 1 && jsonDecode(dataFromServer)['connection'] == 576)
        return true;
    return false;
  }

  static Future<Map> getRoomData(String code, String playerId) async {
    String dataFromRoom = await _getDataFromServer(code, playerId, true);
    if(dataFromRoom != null)
      if(jsonDecode(dataFromRoom)['error'] == 1 && jsonDecode(dataFromRoom)['connection'] == 576)
        return jsonDecode(dataFromRoom)['data'];
    return null;
  }

  //PRIVATE FUNCTIONS

  static Future<String> _getDataFromServer(code, playerId, getData) async{
    String server = _getInfoServer(code, true);
    String room = _getInfoServer(code, false);
    if(server != null && room != null){
      String link = '$server?token=$_token&playerId=$playerId&gameId=$room&${getData ? "getAllInfo=true" : ""}';
      final response = await http.get(link);
      if(response.statusCode == 200)
        return response.body;
    }
    return null;
  }

  static String _getInfoServer(String code, bool getServer){
    List<String> allInfo = code.split('#');
    if(allInfo.length == 2)
      return '${getServer ? "http://" : ""}${allInfo[getServer ? 0 : 1]}${getServer ? ".ngrok.io/" : ""}';
    return null;
  }

}