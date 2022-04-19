import 'package:flutter/material.dart';
import 'package:myrpg_support/models/character.dart';
import 'package:myrpg_support/widgets/character_tile.dart';

class CharactersTab extends StatelessWidget {
  const CharactersTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CharacterTile(Character.fromMap(
      {
      'nome': "Luisz576",
      'raca': "df",
      'classe': "ewe",
      'lvl': 2,
      'gold': 2,
      'maxhp': 20,
      'maxmp': 2,
      'xp': 2,
      'at': 2,
      'def': 2,
      'vel': 2,
      'sort': 2,
      'influencia': 2,
      'hpatual': 10,
      'mpatual': 2,
      'image': "https://pbs.twimg.com/media/FJAfKYJXoAICYft?format=jpg&name=4096x4096",
      'skills': [0, 0],
      'inventory': {
        "0": {
          "id": 2,
          "quantidade": 10
        }
      },
    }
    ));
  }
}