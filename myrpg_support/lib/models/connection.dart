import 'package:myrpg_support/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Connection{

  final String _roomCode;
  IO.Socket? _socket;
  final List<Function> _listeners = [];

  Connection(this._roomCode);

  //WebSocket functions
  open(Function callback){
    if(isOpened()){
      throw "The connected is already opened!";
    }
    _socket = IO.io(Api.urlBase);
    _socket!.on("connect", (_){
      _socket!.emit("select_room", _roomCode);
      callback();
    });
    _socket!.on("disconnect", _onDisconnect);
    _socket!.on("update_data", _onReciveData);
  }

  bool isOpened(){ return _socket != null; }

  bool isConnected(){
    if(isOpened()){
      return _socket!.connected;
    }
    return false;
  }

  void close(){
    if(isOpened()){
      _socket!.disconnect();
    }
    _socket = null;
  }

  void addDataReciveListener(Function listener){
    _listeners.add(listener);
  }
  bool removeDataReciveListener(Function listener){
    return _listeners.remove(listener);
  }

  void _onReciveData(data){
    for(Function listener in _listeners){
      listener(data);
    }
  }

  void _onDisconnect(_data){
    close();
    _onReciveData(null);
  }

  //HTTP functions
  Future<http.Response> get(String path, {Map<String, String>? args}) async{
    String url = Api.urlBase + path;
    String query = "?";
    if(args != null){
      if(args["room"] == null) {
        args["room"] = _roomCode;
      }
      for(String arg in args.keys){
        if(query == "?"){
          query += arg + "=" + args[arg]!;
        }else{
          query += "&" + arg + "=" + args[arg]!;
        }
      }
    }
    return await http.get(Uri.parse(url + query));
  }

  Future<http.Response> post(String path, {Map<String, String>? args}) async{
    String url = Api.urlBase + path;
    if(args != null && args["room"] == null) {
      args["room"] = _roomCode;
    }
    return await http.post(Uri.parse(url), headers: args);
  }

  /* THE APP CAN'T DELETE THINGS
  Future<http.Response> delete(String path, String id) async{
    String url = Api.urlBase + path + "/$id";
    return await http.delete(Uri.parse(url));
  }*/

}