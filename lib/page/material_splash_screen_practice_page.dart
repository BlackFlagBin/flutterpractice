import 'package:flutter/material.dart';

class MaterialSplashScreenPracticePage extends StatefulWidget {
  @override
  _MaterialSplashScreenPracticePageState createState() =>
      _MaterialSplashScreenPracticePageState();
}

class _MaterialSplashScreenPracticePageState
    extends State<MaterialSplashScreenPracticePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
