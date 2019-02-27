import 'package:flutter/material.dart';

import './hex_color.dart';
import './main.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MainMenu created');
    return new Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(height: 300, width: 400),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/logo.jpg'))),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildGameButton(context, '1 Player'),
            buildGameButton(context, '2 Players')
          ],
        ),
        ),
        buildGameButton(context, 'Rules'),
      ],
    );
  }

  Widget buildGameButton(BuildContext context, String inStr) {
    print('build 1p button created');
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('333333')),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      child: FlatButton(
          child: Text(inStr),
          onPressed: () {
            switch (inStr) {
              case "1 Player":
                click1pGame(context);
                break;
              case '2 Players':
                click2pGame(context);
                break;
              case 'Rules':
                null;
                break;
              default:
            }
          }),
    );
  }

  void click1pGame(BuildContext context) {
    print("button start 1p game");
    Navigator.of(context).pushNamed('/screen1pGame');
  }

  void click2pGame(BuildContext context) {
    print('button start 2p game');
    // Navigator.of(context).pushNamed('/screen1pGame');
  }
}
