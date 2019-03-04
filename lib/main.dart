import 'package:flutter/material.dart';

import './body.dart';
import './menu.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  final Color mainColor = Color(0xffb71c1c);
  final Color darkMainColor = Color(0xffc62828);

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
        });
  }
}
