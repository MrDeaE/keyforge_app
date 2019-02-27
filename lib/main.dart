import 'package:flutter/material.dart';

import './body.dart';
import './hex_color.dart';
import './menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String mainColor = '56282d';
  String darkMainColor = '56282d';
  @override
  Widget build(BuildContext context) {
    print('myApp created');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Greatest KeyForge App yet'),
          backgroundColor: HexColor('cde6f5').withOpacity(0.6),
        ),
        backgroundColor: HexColor('8da7be').withOpacity(1.0),
        body: MainMenu(),
      ),
      routes: <String, WidgetBuilder>{
        '/screenMenu': (BuildContext context) => new MainMenu(),
        '/screen1pGame': (BuildContext context) => new MainBody()
      }
    );
  }
}