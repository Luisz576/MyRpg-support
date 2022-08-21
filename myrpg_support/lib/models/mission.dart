import 'package:myrpg_support/models/item.dart';
import 'package:myrpg_support/widgets/data_item.dart';

class Mission{

  String? title, descricao;
  int? id, recompensaType, recompensa, quantItemRecive;
  bool? principal, completed, fail;

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
    descricao = map["descricao"];
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
      "recompensaType": recompensaType,
      "recompensa": recompensa,
      "principal": principal,
      "quantItemRecive": quantItemRecive,
      "completed": completed,
      "fail": fail,
    };
  }

}