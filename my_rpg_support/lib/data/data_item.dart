import 'package:my_rpg_support/models/item.dart';

class DataItem{

  static Map<String, Item> data = {
    '0':Item(nome: "", image: "images/item/slot.png", preco: 0),
    '1':Item(nome: "Item", image: "images/item/slot.png", preco: 10),
  };

  static Item getItem(int id, int qnt){
    Item item = data['$id'];
    item.quantidade = qnt;
    return item;
  }
  static Item getSlotEmpty(){
    return getItem(0, 0);
  }

}