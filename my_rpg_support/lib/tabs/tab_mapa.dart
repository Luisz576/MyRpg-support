import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg_support/data/colors_app.dart';

class TabMapa extends StatefulWidget {
  final String _codeg;
  TabMapa(this._codeg);
  @override
  _TabMapaState createState() => _TabMapaState(_codeg);
}

class _TabMapaState extends State<TabMapa> {
  final String _codeg;
  _TabMapaState(this._codeg);

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[ 
              Center(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "https://inkarnate-api-as-production.s3.amazonaws.com/tkaon6i3glpbvxqzlwiqbtsd52c9",
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: LinearProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ? 
                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                              : null,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.0,),
                    Text(
                      "Mapa criado por Luisz576",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: ColorsApp.primaryWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Localização atual:",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.primaryWhiteColor,
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Text(
                        "Inicio",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.primaryWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}