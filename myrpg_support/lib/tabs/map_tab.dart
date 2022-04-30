import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class MapTab extends StatelessWidget {
  const MapTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Map Tab", style: TextStyle(color: ColorsApp.primaryWhiteColor));
  }
}