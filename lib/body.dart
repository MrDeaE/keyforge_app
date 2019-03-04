import 'package:flutter/material.dart';

import './widgets/card.dart';

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
  num _emberCount = 0,
      _keyCount = 0,
      _chainCount = 0,
      _howManyCards = 0,
      _keyPrice = 6;
  bool _isButtonDisabled;
  List<CreatureCard> _cardList = new List();

  final Color accentColor = Color(0xff7f0000);
  // final Color textColor = Color(0xff333333);
  final Color textColor = Color(0xff000000);
  final Color mainColor = Color(0xffb71c1c);
  final Color darkMainColor = Color(0xffc62828);

  @override
  void initState() {
    _emberCount = 0;
    _keyCount = 0;
    _chainCount = 0;
    _howManyCards = 0;
    _keyPrice = 6;
    _isButtonDisabled = false;
    super.initState();
  }

  TextStyle textStyle(Color col, double size) {
    return TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: col);
  }

void _showCardList(){
  setState(() {
    print(_cardList);
  });
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

  void _increaseKeyPrice() {
    setState(() {
      _keyPrice++;
    });
  }

  void _decreaseKeyPrice() {
    setState(() {
      if (_keyPrice > 0) _keyPrice--;
    });
  }

  Widget _buildEmberArea() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMinusButton('ember', 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(height: 100, width: 100),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ember.png'), fit: BoxFit.fill)),
            child: FlatButton(
              onPressed: () {},
              child: Text('$_emberCount', style: textStyle(textColor, 20)),
              shape: new CircleBorder(),
              color: Colors.white,
              padding: const EdgeInsets.all(1.0),
            ),
          ),
          _buildPlusButton('ember', 15)
        ]);
  }

  Widget _buildKeyArea() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMinusButton('key', 15),
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
                    style: textStyle(textColor, 20),
                  ))),
          _buildPlusButton('key', 15)
        ]);
  }

  Widget _buildChainArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildMinusButton('chain', 15),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'Chains: $_chainCount | Cards: $_howManyCards',
            style: textStyle(textColor, 20),
          ),
        ),
        _buildPlusButton('chain', 15)
      ],
    );
  }

  Widget _buildKeyPriceArea() {
    return Container(
        child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildText('Key Cost', textColor, 16, 20, 10, 20, 6),
            _buildText('$_keyPrice', textColor, 20, 20, 6, 20, 10)
          ],
        ),
        Column(
          children: <Widget>[
            _buildPlusButton('keyPrice', 2),
            _buildMinusButton('keyPrice', 2)
          ],
        )
      ],
    ));
  }

  Widget _buildPlusButton(String s, double margin) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: const EdgeInsets.all(0.0),
      constraints: BoxConstraints.expand(height: 50, width: 50),
      decoration: BoxDecoration(
          border: Border.all(color: textColor),
          borderRadius: BorderRadius.all(Radius.circular(100.0))),
      child: FlatButton(
        child: Text('+', style: textStyle(textColor, 20)),
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
            case 'keyPrice':
              _increaseKeyPrice();
              break;
            default:
              null;
          }
        },
        padding: const EdgeInsets.all(1.0),
      ),
    );
  }

  Widget _buildMinusButton(String s, double margin) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: const EdgeInsets.all(0.0),
      constraints: BoxConstraints.expand(height: 50, width: 50),
      decoration: BoxDecoration(
          border: Border.all(color: textColor),
          borderRadius: BorderRadius.all(Radius.circular(100.0))),
      child: FlatButton(
        child: Text('-', style: textStyle(textColor, 20)),
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
            case 'keyPrice':
              _decreaseKeyPrice();
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
          margin: EdgeInsets.fromLTRB(0, 55, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //back button
              FlatButton(
                child:
                    new Icon(Icons.arrow_back, color: Colors.white, size: 25),
                color: accentColor,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12),
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
            _buildText('Embers', textColor, 14, 0, 0, 0, 10),
            _buildEmberArea(),
            _buildText('Keys', textColor, 14, 0, 20, 0, 10),
            _buildKeyArea(),
            _buildText('Chains', textColor, 14, 0, 20, 0, 10),
            _buildChainArea(),
            _buildKeyPriceArea(),
            
            //cards
            // CreatureCard(_cardList)
          ],
        )
      ],
    );
  }

  Widget _buildText(String text, Color color, double size, double l, double t,
      double r, double d) {
    return Container(
      child: Text(text, style: textStyle(color, size)),
      margin: EdgeInsets.fromLTRB(l, t, r, d),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('_MainBodyState build');
    return Scaffold(
      backgroundColor: darkMainColor,
      body: Column(
        children: <Widget>[_look(context)],
      ),
    );
  }
}
