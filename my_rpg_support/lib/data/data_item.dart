import 'package:flutter/material.dart';
import 'package:my_rpg/data/colors_app.dart';
import 'package:my_rpg/models/item.dart';

class DataItem{

  static Map<String, Item> data = {
    '0':Item(nome: "Slot", image: "images/item/slot.png", preco: 0),
    '1':Item(nome: "Poção de cura peq.", image: "images/item/pocao_cura_peq.png", preco: 50, descricao: "Cura +10 de hp"),
    '2':Item(nome: "Poção de cura media", image: "images/item/pocao_cura_medio.png", preco: 90, descricao: "Cura +20 de hp"),
    '3':Item(nome: "Poção de cura grand.", image: "images/item/pocao_cura_grand.png", preco: 125, descricao: "Cura +30 de hp"),
    '4':Item(nome: "Poção de MP", image: "images/item/pocao_mana.png", preco: 100, descricao: "Cura +10 de mp"),
    '5':Item(nome: "Poção de MP grand.", image: "images/item/pocao_mana_grand.png", preco: 180, descricao: "Cura +20 de mp"),
    '6':Item(nome: "Pão", image: "images/item/pao.png", preco: 5, descricao: "Cura +1 de hp"),
    '7':Item(nome: "Carne", image: "images/item/carne.png", preco: 9, descricao: "Cura +2 de hp"),
    '8':Item(nome: "Espada de ferro leve", image: "images/item/espada_leve.png", preco: 90, descricao: "Uma espada forjada em ferro, perfeita para iniciantes"),
    '9':Item(nome: "Espada de ferro pesada", image: "images/item/espada_pesada.png", preco: 170, descricao: "Uma espada forjada em ferro puro, por ser pesada apenas Guerreiros e Paladinos podem usa-la!"),
    '10':Item(nome: "Katana", image: "images/item/katana.png", preco: 200, descricao: "Uma bela arma forjada para guerrear! Porém ela exige uma certa habilidade em combate."),
    '11':Item(nome: "Escudo de madeira", image: "images/item/escudo_de_madeira.png", preco: 100, descricao: "Um escudo para iniciantes. Não é dos melhores, mas ao menos já é alguma coisa."),
    '12':Item(nome: "Escudo de ferro", image: "images/item/escudo_de_ferro.png", preco: 300, descricao: "Um escudo mais resistente, forjado em ferro"),
    '13':Item(nome: "Escudo mágico", image: "images/item/escudo_magico.png", preco: 700, descricao: "Pode ser equipado com cristáis elementais"),
    '14':Item(nome: "Boomerang", image: "images/item/boomerang.png", preco: 100, descricao: "Um ótimo parceiro nas horas que exigem velocidade"),
    '15':Item(nome: "Monstro selado", image: "images/item/monstro_selado.png", preco: 500, descricao: "Spawna o mostro que estiver dentro"),
    '16':Item(nome: "Presente", image: "images/item/presente.png", preco: -1, descricao: "O que será que tem dentro?"),
    '17':Item(nome: "Armadura mágica", image: "images/item/armadura_magica.png", preco: 300, descricao: "Uma armadura apropriada para um mago ou curandeiro"),
    '18':Item(nome: "Armadura de ferro", image: "images/item/armadura_de_ferro_leve.png", preco: 150, descricao: "Uma armadura mediana que todos podem usar"),
    '19':Item(nome: "Armadura de ferro pesada", image: "images/item/armadura_de_ferro_pesada.png", preco: 210, descricao: "Uma armadura boa, porém pesada, apenas alguns podem usa-la"),
    '20':Item(nome: "Armadura de materia escura", image: "images/item/armadura_de_materia_escura.png", preco: 350, descricao: "Uma armadura que causa terror a todos a sua volta"),
    '21':Item(nome: "Armadura de couro", image: "images/item/armadura_de_couro.png", preco: 60, descricao: "Uma armadura para iniciantes, não muito boa (afinal é pele, o que esperava? Armadura de obsidiam?)"),
    '22':Item(nome: "Livro mágico", image: "images/item/livro_magico.png", preco: -1, descricao: "Um conteudo poderoso que pode causar um super desastre"),
    '23':Item(nome: "Planta ilegal", image: "images/item/planta_ilegal.png", preco: 100, descricao: "Não é permitivo a compra e nem a venda dela! Ps: Se quiser pode consumir"),
    '24':Item(nome: "Pó suspeito", image: "images/item/po_suspeito.png", preco: 120, descricao: "Não recomendado o cunsumo"),
    '25':Item(nome: "Bomba", image: "images/item/bomba.png", preco: 25, descricao: "Causa muito dano!"),
    '26':Item(nome: "Espada de gelo", image: "images/item/espada_de_gelo.png", preco: 300, descricao: "Que frio é esse?"),
    '27':Item(nome: "Espada de materia escura", image: "images/item/espada_da_escuridao.png", preco: 250, descricao: "Bora quebrar tudo!"),
    '28':Item(nome: "Bandana de pirata", image: "images/item/bandana_pirata.png", preco: 20, descricao: "Fique bonitoum, ter uma cara de badboy e etc.."),
    '29':Item(nome: "Luva de couro", image: "images/item/luva_de_couro.png", preco: 30, descricao: "Não suge as mão"),
    '30':Item(nome: "Luva de ferro", image: "images/item/luva_de_ferro.png", preco: 90, descricao: "De socos melhores"),
    '31':Item(nome: "Luva de matéria escura", image: "images/item/luva_de_material_escuro.png", preco: 140, descricao: "Super recomendado para curandeiros e magos!!! Mais poder! #POWER"),
    '32':Item(nome: "Cajado", image: "images/item/cajado.png", preco: 100, descricao: "Um cajado para curandeiros iniciantes"),
    '33':Item(nome: "Cajado de arvore magica", image: "images/item/cajado_de_arvore_magica.png", preco: 250, descricao: "Um cajado feito de uma das madeiras mais cheias de mana e magia"),
    '34':Item(nome: "Cajado de platina", image: "images/item/cajado_de_platina.png", preco: 350, descricao: "Simplismente o melhor material para condução perfeita de mana, sendo assim, muito util para curar"),
    '35':Item(nome: "Bota mágica élfica", image: "images/item/bota_magica_elfica.png", preco: 200, descricao: "Uma bota que dá muito mais velocidade ao usuario, feita pelos elfos, se vc é um elfo terá +1 de vel ainda"),
    '36':Item(nome: "Cristal", image: "images/item/cristal.png", preco: 200, descricao: "Uma pedra mágica preciosa que com a técnica certar, pode-se criar cristais mágicos"),
    '37':Item(nome: "Cristal da água", image: "images/item/cristal_agua.png", preco: 350, descricao: "Uma esfera mágica que aumenta o uso de magias de água"),
    '38':Item(nome: "Cristal do ar", image: "images/item/cristal_ar.png", preco: 350, descricao: "Uma esfera mágica que aumenta o uso de magias de ar"),
    '39':Item(nome: "Cristal do fogo", image: "images/item/cristal_fogo.png", preco: 350, descricao: "Uma esfera mágica que aumenta o uso de magias de fogo"),
    '40':Item(nome: "Cristal da terra", image: "images/item/cristal_terra.png", preco: 350, descricao: "Uma esfera mágica que aumenta o uso de magias de terra"),
    '41':Item(nome: "Moeda Halanhunha", image: "images/item/moeda_halanhunha.png", preco: 15, descricao: "Uma moeda especial, antiga mas ainda pode ser usada"),
    '42':Item(nome: "Barras de ouro", image: "images/item/barras_de_ouro.png", preco: 5000, descricao: "Muito ouro!!!!!!!!!!!!"),
    '43':Item(nome: "Chave velha", image: "images/item/chave_velha.png", preco: -1, descricao: "O que será que essa velharia poderia abrir?"),
    '44':Item(nome: "Chave de prata", image: "images/item/chave_de_prata.png", preco: -1, descricao: "Deve abrir algo realmente chamativo"),
    '45':Item(nome: "Chave mágica", image: "images/item/chave_magica.png", preco: 8000, descricao: "Uma chave que pode abrir quase tudo!"),
    '46':Item(nome: "Carta", image: "images/item/carta.png", preco: -1, descricao: "Isso é um pedaço de papel inutil, agora bora jogar!"),
    '47':Item(nome: "Carta de baralho", image: "images/item/carta_de_baralho.png", preco: 1, descricao: "Pode ser usado em jogos"),
    '48':Item(nome: "Sobretudo de pano", image: "images/item/sobretudo_pano.png", preco: 30, descricao: "Um sobretudo"),
    '49':Item(nome: "sobretudo mágico", image: "images/item/sobretudo_magico.png", preco: 200, descricao: "Um sobretudo que aumenta a magia de quem o veste"),
    '50':Item(nome: "Sobretudo de matéria escura", image: "images/item/sobretudo_de_materia_escura.png", preco: 300, descricao: "Um sobretudo de dar arrepios"),
    '51':Item(nome: "Coroa fina", image: "images/item/coroa_fina.png", preco: 4000, descricao: "Uma bela coroa fina com joias"),
    '52':Item(nome: "Coroa do rei", image: "images/item/coroa_real.png", preco: 20000, descricao: "A coroa do rei!"),
    '53':Item(nome: "Oaca dos dragões", image: "images/item/oaca_dos_dragoes.png", preco: 10000, descricao: "Serve para invocar dragões"),
  };

  //'':Item(nome: "", image: "images/item/.png", preco: , descricao: ""),

  static Item getItem(int id, int qnt){
    Item item = data['$id'];
    item.quantidade = qnt;
    return item;
  }
  static Item getSlotEmpty(){
    return getItem(0, 0);
  }
  static infoItem(Item item, context, {Color lifeColor}){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: ColorsApp.terciaryColor,
          title: Text(
            "${item.nome}",
            style: TextStyle(
              color: ColorsApp.primaryWhiteColor,
              fontSize: 18.0
            ),
          ),
         content: Column(
           children: <Widget>[
             Align(
               alignment: Alignment.topCenter,
               child: SizedBox(
                height: 100.0,
                width: 100.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(item.image, fit: BoxFit.fill,),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: (lifeColor != null) ? lifeColor : ColorsApp.pointGoodColor,
                        radius: 18.0,
                        child: Text(
                          '${item.quantidade}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: ColorsApp.terciaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             ),
              SizedBox(height: 16.0,),
              Text(
                'Preço: ${item.preco >= 0 ? item.preco : "???"} gold',
                style: TextStyle(
                  fontSize: 18.0,
                  color: ColorsApp.primaryWhiteColor,
                ),
              ),
              SizedBox(height: 16.0,),
              SizedBox(
                width: 320,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Descrição:',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ColorsApp.primaryWhiteColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${item.descricao}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: ColorsApp.primaryWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

}