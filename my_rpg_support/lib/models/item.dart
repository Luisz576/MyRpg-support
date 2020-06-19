class Item{

  String nome, image;
  int preco, quantidade;

  Item({String nome, String image, int preco, int quantidade}){
    this.nome = nome;
    this.image = image;
    this.preco = preco;
    if(quantidade != null)
      this.quantidade = quantidade;
  }
  Item.fromMap(Map map){
    nome = map['nome'];
    image = map['image'];
    preco = map['preco'];
    quantidade = map['quantidade'];
  }

  Map toMap(){
    return {
      'nome': nome,
      'image': image,
      'preco': preco,
      'quantidade': quantidade,
    };
  }

}