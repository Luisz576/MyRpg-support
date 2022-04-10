import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';

class MissionsTab extends StatelessWidget {
  const MissionsTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Missions Tab", style: TextStyle(color: ColorsApp.primaryWhiteColor));
  }
}