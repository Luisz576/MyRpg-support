class Jogador{

  String nome, raca, classe, image;
  int lvl, maxhp, maxmp, at, def, vel, sort, hpatual, mpatual, xp;
  List<int> skills;

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
    hpatual = map['hpatual'];
    mpatual = map['mpatual'];
    image = map['image'];
    skills = map['skills'];
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
      'hpatual': hpatual,
      'mpatual': mpatual,
      'image': image,
      'skills': skills,
    };
  }

  static String getSkillImageNull(){
    return "https://yt3.ggpht.com/a/AATXAJzYiUqinCnhv1WhdG8Tvb3H3dOJW4n5B1hhmQ=s48-c-k-c0xffffffff-no-rj-mo";
  }
  static String getSkillName(int id){
    return "Skill name";
  }
  static String getSkillImage(int id){
    return "https://yt3.ggpht.com/a/AATXAJzYiUqinCnhv1WhdG8Tvb3H3dOJW4n5B1hhmQ=s48-c-k-c0xffffffff-no-rj-mo";
  }

}