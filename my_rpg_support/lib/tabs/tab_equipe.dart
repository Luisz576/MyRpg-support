import 'package:flutter/material.dart';

class TabEquipe extends StatefulWidget {
  final String _codeg;
  TabEquipe(this._codeg);
  @override
  _TabEquipeState createState() => _TabEquipeState(_codeg);
}

class _TabEquipeState extends State<TabEquipe> {
  final String _codeg;
  _TabEquipeState(this._codeg);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(),
      ],
    );
  }
}