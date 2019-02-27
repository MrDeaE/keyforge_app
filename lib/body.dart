import 'package:flutter/material.dart';

import './hex_color.dart';
import './menu.dart';

class MainBody extends StatefulWidget {
  MainBody() {
    print('class MainBody constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('class MainBody createState');
    return _MainBodyState();
  }
}

class _MainBodyState extends State<MainBody> {
  num _emberCount = 0, _keyCount = 0, _chainCount = 0, _howManyCards = 0;
  bool _isButtonDisabled;

  @override
  void initState() {
    _emberCount = 0;
    _keyCount = 0;
    _chainCount = 0;
    _howManyCards = 0;
    _isButtonDisabled = false;
    super.initState();
  }

  void _setCardsFromChain(num cc) {
    if (cc == 0) {
      _howManyCards = 0;
    }
    if (cc > 0) {
      _howManyCards = -1;
    }
    if (cc > 6) {
      _howManyCards = -2;
    }
    if (cc > 12) {
      _howManyCards = -3;
    }
    if (cc > 18) {
      _howManyCards = -4;
    }
  }

  void _increaseEmber() {
    setState(() {
      _emberCount++;
    });
    print('increase ember');
  }

  void _decreaseEmber() {
    setState(() {
      if (_emberCount > 0) {
        _emberCount--;
        _isButtonDisabled = false;
        print('decrease ember: $_emberCount');
      } else {
        _isButtonDisabled = true;
        print('ember count cannot be lower than 0!');
      }
    });
  }

  void _increaseKey() {
    setState(() {
      if (_emberCount >= 6) {
        _emberCount -= 6;
        _keyCount++;
        print('key forged');
      } else {
        print('you cannot forge a key!');
      }
      if (_keyCount >= 3) {
        print('you won!!');
        _showWinDialog();
      }
    });
  }

  void _decreaseKey() {
    setState(() {
      if (_keyCount > 0) {
        _keyCount--;
        _emberCount += 6;
        // _isButtonDisabled=false;
        print('decrease key: $_keyCount');
      } else {
        // _isButtonDisabled=true;
        print('key count cannot be lower than 0!');
      }
    });
  }

  void _increaseChain() {
    setState(() {
      _chainCount++;
      _setCardsFromChain(_chainCount);
    });
  }

  void _decreaseChain() {
    setState(() {
      if (_chainCount > 0) {
        _chainCount--;
      }
      _setCardsFromChain(_chainCount);
    });
  }

  Widget _buildEmberArea() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMinusButton('ember'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(height: 100, width: 100),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ember.png'), fit: BoxFit.fill)),
            child: FlatButton(
              onPressed: () {},
              child: Text('$_emberCount',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              shape: new CircleBorder(),
              color: Colors.white,
              padding: const EdgeInsets.all(1.0),
            ),
          ),
          _buildPlusButton('ember')
        ]);
  }

  Widget _buildKeyArea() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMinusButton('key'),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              constraints: BoxConstraints.expand(height: 100, width: 100),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/key.png'))),
              child: FlatButton(
                  disabledColor: Colors.white,
                  shape: CircleBorder(),
                  color: Colors.white,
                  padding: const EdgeInsets.all(1.0),
                  onPressed: () {},
                  child: Text(
                    '$_keyCount',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))),
          _buildPlusButton('key')
        ]);
  }

  Widget _buildChainArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildMinusButton('chain'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'Chains: $_chainCount | Cards: $_howManyCards',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        _buildPlusButton('chain')
      ],
    );
  }

  Widget _buildPlusButton(String s) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(0.0),
      constraints: BoxConstraints.expand(height: 50, width: 50),
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('333333')),
          borderRadius: BorderRadius.all(Radius.circular(100.0))),
      child: FlatButton(
        child: Text('+',
            style: TextStyle(fontSize: 40, color: HexColor('333333'))),
        shape: CircleBorder(),
        onPressed: () {
          switch (s) {
            case 'ember':
              _increaseEmber();
              break;
            case 'key':
              _increaseKey();
              break;
            case 'chain':
              _increaseChain();
              break;
            default:
              null;
          }
        },
        padding: const EdgeInsets.all(1.0),
      ),
    );
  }

  Widget _buildMinusButton(String s) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(0.0),
      constraints: BoxConstraints.expand(height: 50, width: 50),
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('333333')),
          borderRadius: BorderRadius.all(Radius.circular(100.0))),
      child: FlatButton(
        child: Text('-',
            style: TextStyle(fontSize: 40, color: HexColor('333333'))),
        shape: CircleBorder(),
        onPressed: () {
          switch (s) {
            case 'ember':
              _decreaseEmber();
              break;
            case 'key':
              _decreaseKey();
              break;
            case 'chain':
              _decreaseChain();
              break;
            default:
              null;
          }
        },
        padding: const EdgeInsets.all(1.0),
      ),
    );
  }

  void clickBack(BuildContext context) {
    print("button back from 1p game"); //1
    Navigator.of(context).pop(true); //2
  }

  void _showWinDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('You Won!'),
            actions: <Widget>[
              new FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  Widget _look(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 45, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //back button
              FloatingActionButton(
                child:
                    new Icon(Icons.arrow_back, color: Colors.white, size: 25),
                backgroundColor: HexColor('333333'),
                onPressed: () {
                  clickBack(context);
                },
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            //embers etc
            Text('Current Embers:'),
            _buildEmberArea(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('Keys'),
            ),
            _buildKeyArea(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 5),
              child: Text('Chains:'),
            ),
            _buildChainArea()
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('_MainBodyState build');
    return Scaffold(
      backgroundColor: HexColor('8da7be'),
      body: Column(
        children: <Widget>[_look(context)],
      ),
    );
  }
}
