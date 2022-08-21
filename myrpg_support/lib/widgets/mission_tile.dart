import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/models/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  const MissionTile(this.mission, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Card(
        elevation: 4.0,
        child: InkWell(
          onTap: (){},
          child: Container(
            height: 150.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mission.title!,
                    style: TextStyle(
                      color: ColorsApp.primaryWhiteColor,
                      fontSize: 24.0,
                      fontWeight:  mission.completed! ? FontWeight.normal : FontWeight.bold,
                      decoration: mission.completed! ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                  ),
                  Text(mission.descricao!,
                    style: const TextStyle(
                      color: ColorsApp.primaryWhiteColor,
                      fontSize: 18.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("${mission.recompensa!}",
                      style: const TextStyle(
                        color: ColorsApp.primaryWhiteColor,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: ColorsApp.buildDrawerBox(ColorsApp.terciaryColor, ColorsApp.terciaryColor, (mission.principal! ? ColorsApp.pointBadColor : ColorsApp.secundaryColor), (mission.principal! ? ColorsApp.pointBadColor : ColorsApp.secundaryColor), Alignment.topCenter, Alignment.bottomCenter),
          ),
        ),
      ),
    );
  }
}