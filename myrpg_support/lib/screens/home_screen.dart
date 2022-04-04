import 'package:flutter/material.dart';
import 'package:myrpg_support/services/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Center(
        child: InkWell(
          child: const Icon(Icons.ac_unit_outlined, size: 50,),
          onTap: (){
            print(Api.connectToRoom("1"));
          },
        )
      ),
    );
  }
}