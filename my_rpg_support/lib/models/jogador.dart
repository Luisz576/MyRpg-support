import 'package:my_rpg_support/data/data_item.dart';
import 'package:my_rpg_support/models/item.dart';

class Jogador{

  String nome, raca, classe, image;
  int lvl, maxhp, maxmp, at, def, vel, sort, influencia, hpatual, mpatual, xp;
  List<int> skills;
  Map inventory;

  Item getItem(int index){
    if(inventory['$index'] == null)
      return DataItem.getSlotEmpty();
    return DataItem.getItem(inventory['$index']['id'], inventory['$index']['quantidade']);
  }

  Jogador.fromMap(Map map){
    nome = map['nome'];
    raca = map['raca'];
    classe = map['classe'];
    lvl = map['lvl'];
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

  static String getSkillImageNull(){
    return getSkillImage(0);
  }
  static String getSkillNameNull(){
    return getSkillName(0);
  }
  static String getSkillName(int id){
    Map skills = {
      "0":"",
      "1":"Skill name",
    };
    return skills['$id'];
  }
  static String getSkillImage(int id){
    Map skills = {
      "0":"images/item/slot.png",
      "1":"images/item/slot.png",
    };
    return skills['$id'];
  }

}