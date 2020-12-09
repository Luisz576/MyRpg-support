import 'package:my_rpg/data/data_item.dart';
import 'package:my_rpg/models/item.dart';

class Missao{

  String title, descricao;
  int id, recompensaType, recompensa, quantItemRecive;
  bool principal, completed, fail;
  List<dynamic> objs;

  Item getItem(){
    if(recompensaType == 1)
      return DataItem.getItem(recompensa, quantItemRecive);
    return DataItem.getSlotEmpty();
  }

  int getGold(){
    if(recompensaType == 2)
      return recompensa;
    return -1;
  }

  Missao.fromMap(Map map){
    id = map['id'];
    title = map["title"];
    descricao = map["content"];
    objs = map["objetivos"];
    recompensaType = map["recompensa_type"];
    recompensa = map["recompensa"];
    principal = map["principal"];
    quantItemRecive = map["recompensa_if_item_quant"];
    completed = map["completed"];
    fail = map["fail"];
  }

  Map toMap(){
    return {
      "id": id,
      "title": title,
      "content": descricao,
      "objetivos": objs,
      "recompensa_type": recompensaType,
      "recompensa": recompensa,
      "principal": principal,
      "recompensa_if_item_quant": quantItemRecive,
      "completed": completed,
      "fail": fail,
    };
  }

}