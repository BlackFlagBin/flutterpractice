import 'package:flutter/material.dart';

class CalculatorPracticePage extends StatefulWidget {
  @override
  _CalculatorPracticePageState createState() => _CalculatorPracticePageState();
}

class _CalculatorPracticePageState extends State<CalculatorPracticePage> {
  int _firstNum = 0;
  int _secondNum = 0;
  int _result = 0;

  TextEditingController _firstController = new TextEditingController(text: "0");
  TextEditingController _secondController =
      new TextEditingController(text: "0");

  void _add() {
    setState(() {
      _firstNum = int.parse(_firstController.text);
      _secondNum = int.parse(_secondController.text);
      _result = _firstNum + _secondNum;
    });
  }

  void _minus() {
    setState(() {
      _firstNum = int.parse(_firstController.text);
      _secondNum = int.parse(_secondController.text);
      _result = _firstNum - _secondNum;
    });
  }

  void _multiply() {
    setState(() {
      _firstNum = int.parse(_firstController.text);
      _secondNum = int.parse(_secondController.text);
      _result = _firstNum * _secondNum;
    });
  }

  void _divide() {
    setState(() {
      _firstNum = int.parse(_firstController.text);
      _secondNum = int.parse(_secondController.text);
      _result = _firstNum ~/ _secondNum;
    });
  }

  void _clear() {
    setState(() {
      _firstController.text = "";
      _secondController.text = "";
      _firstNum = 0;
      _secondNum = 0;
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator Practice"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Result is $_result",
              style: new TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new TextField(
              controller: _firstController,
              decoration: new InputDecoration(
                  hintText: "请输入第一个数字",
                  labelText: "第一个数字",
                  labelStyle: new TextStyle(color: Colors.blue)),
              keyboardType: TextInputType.number,
            ),
            new TextField(
              controller: _secondController,
              decoration: new InputDecoration(
                  hintText: "请输入第二个数字",
                  labelText: "第二个数字",
                  labelStyle: new TextStyle(color: Colors.blue)),
              keyboardType: TextInputType.number,
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new MaterialButton(
                  onPressed: _add,
                  child: new Text(
                    "+",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                new MaterialButton(
                  onPressed: _minus,
                  child: new Text(
                    "-",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new MaterialButton(
                  onPressed: _multiply,
                  child: new Text(
                    "*",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                new MaterialButton(
                  onPressed: _divide,
                  child: new Text(
                    "/",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new MaterialButton(
              onPressed: _clear,
              child: new Text(
                "Clear",
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
