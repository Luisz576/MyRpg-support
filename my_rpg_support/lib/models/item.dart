class Item{

  String nome, image, descricao;
  int preco, quantidade;

  Item({String nome, String image, int preco, int quantidade, String descricao}){
    this.nome = nome;
    this.image = image;
    this.preco = preco;
    this.descricao = descricao;
    if(quantidade != null)
      this.quantidade = quantidade;
  }

  Map toMap(){
    return {
      'quantidade': quantidade,
    };
  }

}