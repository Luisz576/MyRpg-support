class Jogador{

  String nome, raca, classe, image;
  int lvl, maxhp, maxmp, at, def, vel, sort, hpatual, mpatual;

  Jogador.fromMap(Map map){
    nome = map['nome'];
    raca = map['raca'];
    classe = map['classe'];
    lvl = map['lvl'];
    maxhp = map['maxhp'];
    maxmp = map['maxmp'];
    at = map['at'];
    def = map['def'];
    vel = map['vel'];
    sort = map['sort'];
    hpatual = map['hpatual'];
    mpatual = map['mpatual'];
    image = map['image'];
  }

  Map toMap(){
    return {
      'nome': nome,
      'raca': raca,
      'classe': classe,
      'lvl': lvl,
      'maxhp': maxhp,
      'maxmp': maxmp,
      'at': at,
      'def': def,
      'vel': vel,
      'sort': sort,
      'hpatual': hpatual,
      'mpatual': mpatual,
      'image': image,
    };
  }

}