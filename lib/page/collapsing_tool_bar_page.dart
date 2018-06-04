import 'package:flutter/material.dart';

class CollapsingToolBarPage extends StatefulWidget {
  @override
  _CollapsingToolBarPageState createState() => _CollapsingToolBarPageState();
}

class _CollapsingToolBarPageState extends State<CollapsingToolBarPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CollapsingToolBar"),
      ),
    );
  }
}
