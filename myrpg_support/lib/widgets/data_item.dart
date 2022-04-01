import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/models/item.dart';

class DataItem{

  static Map<String, Item> data = {
    '0':Item("Slot", "images/item/slot.png", 0, ""),
    '1':Item("Poção de cura peq.", "images/item/pocao_cura_peq.png", 50, "Cura +10 de hp"),
    '2':Item("Poção de cura media", "images/item/pocao_cura_medio.png", 90, "Cura +20 de hp"),
    '3':Item("Poção de cura grand.", "images/item/pocao_cura_grand.png", 125, "Cura +30 de hp"),
    '4':Item("Poção de MP", "images/item/pocao_mana.png", 100, "Cura +10 de mp"),
    '5':Item("Poção de MP grand.", "images/item/pocao_mana_grand.png", 180, "Cura +20 de mp"),
    '6':Item("Pão", "images/item/pao.png", 5, "Cura +1 de hp"),
    '7':Item("Carne", "images/item/carne.png", 9, "Cura +2 de hp"),
    '8':Item("Espada de ferro leve", "images/item/espada_leve.png", 90, "Uma espada forjada em ferro, perfeita para iniciantes"),
    '9':Item("Espada de ferro pesada", "images/item/espada_pesada.png", 170, "Uma espada forjada em ferro puro, por ser pesada apenas Guerreiros e Paladinos podem usa-la!"),
    '10':Item("Katana", "images/item/katana.png", 200, "Uma bela arma forjada para guerrear! Porém ela exige uma certa habilidade em combate."),
    '11':Item("Escudo de madeira", "images/item/escudo_de_madeira.png", 100, "Um escudo para iniciantes. Não é dos melhores, mas ao menos já é alguma coisa."),
    '12':Item("Escudo de ferro", "images/item/escudo_de_ferro.png", 300, "Um escudo mais resistente, forjado em ferro"),
    '13':Item("Escudo mágico", "images/item/escudo_magico.png", 700, "Pode ser equipado com cristáis elementais"),
    '14':Item("Boomerang", "images/item/boomerang.png", 100, "Um ótimo parceiro nas horas que exigem velocidade"),
    '15':Item("Monstro selado", "images/item/monstro_selado.png", 500, "Spawna o mostro que estiver dentro"),
    '16':Item("Presente", "images/item/presente.png", -1, "O que será que tem dentro?"),
    '17':Item("Armadura mágica", "images/item/armadura_magica.png", 300, "Uma armadura apropriada para um mago ou curandeiro"),
    '18':Item("Armadura de ferro", "images/item/armadura_de_ferro_leve.png", 150, "Uma armadura mediana que todos podem usar"),
    '19':Item("Armadura de ferro pesada", "images/item/armadura_de_ferro_pesada.png", 210, "Uma armadura boa, porém pesada, apenas alguns podem usa-la"),
    '20':Item("Armadura de materia escura", "images/item/armadura_de_materia_escura.png", 350, "Uma armadura que causa terror a todos a sua volta"),
    '21':Item("Armadura de couro", "images/item/armadura_de_couro.png", 60, "Uma armadura para iniciantes, não muito boa (afinal é pele, o que esperava? Armadura de obsidiam?)"),
    '22':Item("Livro mágico", "images/item/livro_magico.png", -1, "Um conteudo poderoso que pode causar um super desastre"),
    '23':Item("Planta ilegal", "images/item/planta_ilegal.png", 100, "Não é permitivo a compra e nem a venda dela! Ps: Se quiser pode consumir"),
    '24':Item("Pó suspeito", "images/item/po_suspeito.png", 120, "Não recomendado o cunsumo"),
    '25':Item("Bomba", "images/item/bomba.png", 25, "Causa muito dano!"),
    '26':Item("Espada de gelo", "images/item/espada_de_gelo.png", 300, "Que frio é esse?"),
    '27':Item("Espada de materia escura", "images/item/espada_da_escuridao.png", 250, "Bora quebrar tudo!"),
    '28':Item("Bandana de pirata", "images/item/bandana_pirata.png", 20, "Fique bonitoum, ter uma cara de badboy e etc.."),
    '29':Item("Luva de couro", "images/item/luva_de_couro.png", 30, "Não suge as mão"),
    '30':Item("Luva de ferro", "images/item/luva_de_ferro.png", 90, "De socos melhores"),
    '31':Item("Luva de matéria escura", "images/item/luva_de_material_escuro.png", 140, "Super recomendado para curandeiros e magos!!! Mais poder! #POWER"),
    '32':Item("Cajado", "images/item/cajado.png", 100, "Um cajado para curandeiros iniciantes"),
    '33':Item("Cajado de arvore magica", "images/item/cajado_de_arvore_magica.png", 250, "Um cajado feito de uma das madeiras mais cheias de mana e magia"),
    '34':Item("Cajado de platina", "images/item/cajado_de_platina.png", 350, "Simplismente o melhor material para condução perfeita de mana, sendo assim, muito util para curar"),
    '35':Item("Bota mágica élfica", "images/item/bota_magica_elfica.png", 200, "Uma bota que dá muito mais velocidade ao usuario, feita pelos elfos, se vc é um elfo terá +1 de vel ainda"),
    '36':Item("Cristal", "images/item/cristal.png", 200, "Uma pedra mágica preciosa que com a técnica certar, pode-se criar cristais mágicos"),
    '37':Item("Cristal da água", "images/item/cristal_agua.png", 350, "Uma esfera mágica que aumenta o uso de magias de água"),
    '38':Item("Cristal do ar", "images/item/cristal_ar.png", 350, "Uma esfera mágica que aumenta o uso de magias de ar"),
    '39':Item("Cristal do fogo", "images/item/cristal_fogo.png", 350, "Uma esfera mágica que aumenta o uso de magias de fogo"),
    '40':Item("Cristal da terra", "images/item/cristal_terra.png", 350, "Uma esfera mágica que aumenta o uso de magias de terra"),
    '41':Item("Moeda Halanhunha", "images/item/moeda_halanhunha.png", 15, "Uma moeda especial, antiga mas ainda pode ser usada"),
    '42':Item("Barras de ouro", "images/item/barras_de_ouro.png", 5000, "Muito ouro!!!!!!!!!!!!"),
    '43':Item("Chave velha", "images/item/chave_velha.png", -1, "O que será que essa velharia poderia abrir?"),
    '44':Item("Chave de prata", "images/item/chave_de_prata.png", -1, "Deve abrir algo realmente chamativo"),
    '45':Item("Chave mágica", "images/item/chave_magica.png", 8000, "Uma chave que pode abrir quase tudo!"),
    '46':Item("Carta", "images/item/carta.png", -1, "Isso é um pedaço de papel inutil, agora bora jogar!"),
    '47':Item("Carta de baralho", "images/item/carta_de_baralho.png", 1, "Pode ser usado em jogos"),
    '48':Item("Sobretudo de pano", "images/item/sobretudo_pano.png", 30, "Um sobretudo"),
    '49':Item("sobretudo mágico", "images/item/sobretudo_magico.png", 200, "Um sobretudo que aumenta a magia de quem o veste"),
    '50':Item("Sobretudo de matéria escura", "images/item/sobretudo_de_materia_escura.png", 300, "Um sobretudo de dar arrepios"),
    '51':Item("Coroa fina", "images/item/coroa_fina.png", 4000, "Uma bela coroa fina com joias"),
    '52':Item("Coroa do rei", "images/item/coroa_real.png", 20000, "A coroa do rei!"),
    '53':Item("Oaca dos dragões", "images/item/oaca_dos_dragoes.png", 10000, "Serve para invocar dragões"),
  };

  static Item? getItem(int id, int qnt){
    Item? item = data['$id'];
    if(item == null) return null;
    item.quantidade = qnt;
    return item;
  }
  static Item getSlotEmpty(){
    return getItem(0, 0)!;
  }
  static infoItem(Item item, context, Color? lifeColor){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: ColorsApp.terciaryColor,
          title: Text(
            item.nome,
            style: const TextStyle(
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
                          style: const TextStyle(
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
              const SizedBox(height: 16.0,),
              Text(
                'Preço: ${item.preco >= 0 ? item.preco : "???"} gold',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: ColorsApp.primaryWhiteColor,
                ),
              ),
              const SizedBox(height: 16.0,),
              SizedBox(
                width: 320,
                child: Column(
                  children: <Widget>[
                    const Align(
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
                        item.descricao,
                        style: const TextStyle(
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