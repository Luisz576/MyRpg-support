import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class MapTab extends StatelessWidget {
  const MapTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/map/Mapa.jpg"),
        const SizedBox(
          height: 20,
        ),
        const Text("Mapa desenvolvido por: Luisz576",
          style: TextStyle(
            color: ColorsApp.primaryWhiteColor,
            fontSize: 18
          ),
        )
      ],
    );
  }
}