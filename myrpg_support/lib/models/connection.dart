import 'package:myrpg_support/services/api.dart';
import 'package:http/http.dart' as http;

class Connection{

  String _roomCode;

  Connection(this._roomCode);

  Future<http.Response> get(String path, Map<String, String> args) async{
    String url = Api.urlBase + path;
    return await http.get(Uri.parse(url), headers: args);
  }

  Future<http.Response> post(String path, Map<String, String> args) async{
    String url = Api.urlBase + path;
    return await http.post(Uri.parse(url), headers: args);
  }

}