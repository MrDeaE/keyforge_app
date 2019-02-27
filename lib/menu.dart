import 'package:flutter/material.dart';

import './hex_color.dart';
import './main.dart';



class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MainMenu created');
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[build1PButton(context)],
        )
      ],
    );
  }

  Widget build1PButton(BuildContext context) {
    print('build 1p button created');
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('333333')),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      child: RawMaterialButton(
          child: Text('Start 1p Game'),
          onPressed:  () {
            click1pGame(context);
          }
          ),
    );
  }

  void click1pGame(BuildContext context) {
    print("button start 1p game"); //1
    Navigator.of(context).pushNamed('/screen1pGame'); //2
  }
}
