import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      setState(() {
        _output = "0";
        _input = "";
        _operator = "";
        _num1 = 0.0;
        _num2 = 0.0;
      });
    } else if (buttonText == "=") {
      if (_operator.isNotEmpty) {
        _num2 = double.tryParse(_input) ?? 0.0;
        switch (_operator) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "x":
            _output = (_num1 * _num2).toString();
            break;
          case "÷":
            _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
            break;
        }
        setState(() {
          _input = _output;
          _operator = "";
        });
      }
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "÷") {
      _num1 = double.tryParse(_input) ?? 0.0;
      _operator = buttonText;
      _input = "";
    } else {
      setState(() {
        _input += buttonText;
        _output = _input;
      });
    }
  }

  Widget buildButton(String buttonText, Color textColor, Color buttonColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () => buttonPressed(buttonText),
        child: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 40.0, color: textColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF82E57B), // Yashil fon
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Natija ekrani (Elips shaklidagi)
          // Natija ekrani (Elips shaklidagi)
          Container(
            alignment: Alignment.centerRight, // O'ng tarafga hizalanadi
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x42000000),
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right, // Matnni o'ng tomonga hizalaydi
            ),
          ),

          // Tugmalar paneli
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildButton("C", Colors.green, Colors.black),
                      buildButton("m", Colors.green, Colors.black),
                      buildButton("%", Colors.green, Colors.black),
                      buildButton("÷", Colors.green, Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("7", Colors.white, Colors.black),
                      buildButton("8", Colors.white, Colors.black),
                      buildButton("9", Colors.white, Colors.black),
                      buildButton("x", Colors.green, Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4", Colors.white, Colors.black),
                      buildButton("5", Colors.white, Colors.black),
                      buildButton("6", Colors.white, Colors.black),
                      buildButton("-", Colors.green, Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("1", Colors.white, Colors.black),
                      buildButton("2", Colors.white, Colors.black),
                      buildButton("3", Colors.white, Colors.black),
                      buildButton("+", Colors.green, Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("0", Colors.white, Colors.black),
                      buildButton(",", Colors.white, Colors.black),
                      buildButton("+/-", Colors.white, Colors.black),
                      buildButton("=", Colors.green, Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
