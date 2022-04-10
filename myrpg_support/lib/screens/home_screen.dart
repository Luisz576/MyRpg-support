import 'package:flutter/material.dart';
import 'package:myrpg_support/data/colors_app.dart';
import 'package:myrpg_support/screens/game_screen.dart';
import 'package:myrpg_support/services/api.dart';
import 'package:myrpg_support/widgets/game_scaffold.dart';
import 'package:myrpg_support/widgets/green_button.dart';
import 'package:myrpg_support/widgets/input_camp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _codeController = TextEditingController();

  bool _errorToConnectWithRoom = false,
  _emptyCamp = false,
  _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      title: "My RPG Support",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            InputCamp(_codeController, hintText: "Room Code"),
            const SizedBox(height: 20.0,),
            GreenButton("Entrar", onPressed: () async{
              if(_codeController.text.isNotEmpty){
                setState(() {
                  _emptyCamp = false;
                  _isLoading = true;
                });
                if(await Api.connectToRoom(_codeController.text)){
                  Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const GameScreen()),
                  (route) => false);
                }else{
                  setState(() {
                    _errorToConnectWithRoom = true;
                  });
                }
                setState(() {
                  _isLoading = false;
                });
              }else{
                setState(() {
                  _emptyCamp = true;
                });
              }
            }),
            const SizedBox(height: 10.0,),
            _isLoading ? const Text("Conectando à sala...",
              style: TextStyle(
                color: ColorsApp.secundaryColor
              ),
            ) : _emptyCamp ? const Text("Informe o Room Code!",
              style: TextStyle(
                color: ColorsApp.errorColor
              ),
            ) :
            _errorToConnectWithRoom ? const Text("Sala não encontrada!",
              style: TextStyle(
                color: ColorsApp.errorColor
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }
}