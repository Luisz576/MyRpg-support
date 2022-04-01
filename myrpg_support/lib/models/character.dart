import 'package:myrpg_support/models/item.dart';
import 'package:myrpg_support/widgets/data_item.dart';

class Character{

  String nome = "", raca = "", classe = "", image = "";
  int lvl = 0, gold = 0, maxhp = 0, maxmp = 0, at = 0, def = 0, vel = 0, sort = 0, influencia = 0, hpatual = 0, mpatual = 0, xp = 0;
  List<dynamic> skills = List.empty();
  Map inventory = {};

  Item? getItem(int index){
    if(inventory['$index'] == null){
      return DataItem.getSlotEmpty();
    }
    return DataItem.getItem(inventory['$index']['id'], inventory['$index']['quantidade']);
  }

  Character.fromMap(Map map){
    nome = map['nome'];
    raca = map['raca'];
    classe = map['classe'];
    lvl = map['lvl'];
    gold = map['gold'];
    maxhp = map['maxhp'];
    maxmp = map['maxmp'];
    xp = map['xp'];
    at = map['at'];
    def = map['def'];
    vel = map['vel'];
    sort = map['sort'];
    influencia = map['influencia'];
    hpatual = map['hpatual'];
    mpatual = map['mpatual'];
    image = map['image'];
    skills = map['skills'];
    inventory = map['inventory'];
  }

  Map toMap(){
    return {
      'nome': nome,
      'raca': raca,
      'classe': classe,
      'lvl': lvl,
      'gold': gold,
      'maxhp': maxhp,
      'maxmp': maxmp,
      'xp': xp,
      'at': at,
      'def': def,
      'vel': vel,
      'sort': sort,
      'influencia': influencia,
      'hpatual': hpatual,
      'mpatual': mpatual,
      'image': image,
      'skills': skills,
      'inventory': inventory,
    };
  }

  //TODO: SKILLS
  static String getSkillImageNull(){
    return getSkillImage(0);
  }
  static String getSkillImage(int id){
    Map skills = {
      "0":"images/item/slot.png",
      "1":"images/item/slot.png",
    };
    return skills['$id'];
  }

}