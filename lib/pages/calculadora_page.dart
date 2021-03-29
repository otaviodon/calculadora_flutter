import 'package:calculadora/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Calculadora',
          textAlign: TextAlign.center,
        ),
        //elevation: 4.0,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.share),
              onPressed: () => Share.share(
                  'Look my new App (Calculator) - https://example.com'))
        ],
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _buildDisplayAll(result: _controller.resultAll),
        Divider(color: Colors.grey),
        _buildDisplay(result: _controller.result),
        Divider(color: Colors.white),
        _buildKeyboard(),
      ]),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 400,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: 'AC', color: Colors.deepOrange),
                _buildButton(label: 'DEL', color: Colors.deepOrange),
                _buildButton(label: '%', color: Colors.deepOrange),
                _buildButton(label: '/', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '7'),
                _buildButton(label: '8'),
                _buildButton(label: '9'),
                _buildButton(label: 'x', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '4'),
                _buildButton(label: '5'),
                _buildButton(label: '6'),
                _buildButton(label: '+', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '1'),
                _buildButton(label: '2'),
                _buildButton(label: '3'),
                _buildButton(label: '-', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '0', flex: 2),
                _buildButton(label: ','),
                _buildButton(label: '=', color: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDisplay({String result}) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          result,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.lightGreenAccent[400],
            fontSize: 52,
            fontFamily: 'Calculator',
          ),
        ),
      ),
    );
  }

  _buildDisplayAll({String result}) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Text(
          result,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.lightGreenAccent[400],
            fontSize: 25,
            fontFamily: 'Calculator',
          ),
        ),
      ),
    );
  }

  _buildButton({String label, int flex = 1, color = Colors.white}) {
    // underline deixa privado
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label ?? '',
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _controller.applyCommand(label);
          });
        },
      ),
    );
  }
}
