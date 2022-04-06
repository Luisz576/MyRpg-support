import 'package:myrpg_support/services/api.dart';
import 'package:http/http.dart' as http;

class Connection{

  final String _roomCode;

  Connection(this._roomCode);

  Future<http.Response> get(String path, {Map<String, String>? args}) async{
    String url = Api.urlBase + path;
    if(args != null && args["room"] == null) {
      args["room"] = _roomCode;
    }
    return await http.get(Uri.parse(url), headers: args);
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