import 'package:flutter/material.dart';

class CreatureCard extends StatelessWidget{
  List<String> cardsList = new List();

CreatureCard(this.cardsList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: cardsList
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
 
}




// child: Text('Creature', style: TextStyle(fontSize: 10, color: Colors.black),),
//       width: 80,
//       height: 140,
//       color: Colors.white,