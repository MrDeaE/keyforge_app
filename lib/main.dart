import 'package:flutter/material.dart';

import './body.dart';
import './menu.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  
  final Color mainColor = Color(0xff8da7be);
  final Color darkMainColor = Color(0xffcde6f5);

  @override
  Widget build(BuildContext context) {
    print('myApp created');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Greatest KeyForge App yet'),
          backgroundColor: mainColor,
        ),
        backgroundColor: darkMainColor,
        body: MainMenu(),
      ),
      routes: <String, WidgetBuilder>{
        '/screenMenu': (BuildContext context) => MainMenu(),
        '/screen1pGame': (BuildContext context) => MainBody()
      }
    );
  }
}