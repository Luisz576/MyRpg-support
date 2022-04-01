import 'package:myrpg_support/services/api.dart';
import 'package:http/http.dart' as http;

class Connection{

  String _urlBase = "";

  Connection(String roomCode){
    _urlBase = Api.urlBase + "/" + roomCode;
  }

  Future<http.Response> get(String path, Map<String, String> args) async{
    String url = _urlBase + "/" + path;
    return await http.get(Uri.parse(url), headers: args);
  }

}