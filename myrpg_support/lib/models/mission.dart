import 'package:myrpg_support/models/item.dart';
import 'package:myrpg_support/widgets/data_item.dart';

class Mission{

  String? title, descricao;
  int? id, recompensaType, recompensa, quantItemRecive;
  bool? principal, completed, fail;
  List<dynamic>? objs;

  Item? getItem(){
    if(recompensaType == 1){
      return DataItem.getItem(recompensa!, quantItemRecive!);
    }
    return DataItem.getSlotEmpty();
  }

  int getGold(){
    if(recompensaType == 2){
      return recompensa!;
    }
    return -1;
  }

  Mission.fromMap(Map map){
    id = map['id'];
    title = map["title"];
    descricao = map["content"];
    objs = map["objetivos"];
    recompensaType = map["recompensaType"];
    recompensa = map["recompensa"];
    principal = map["principal"];
    quantItemRecive = map["quantItemRecive"];
    completed = map["completed"];
    fail = map["fail"];
  }

  Map toMap(){
    return {
      "id": id,
      "title": title,
      "content": descricao,
      "objetivos": objs,
      "recompensaType": recompensaType,
      "recompensa": recompensa,
      "principal": principal,
      "quantItemRecive": quantItemRecive,
      "completed": completed,
      "fail": fail,
    };
  }

}