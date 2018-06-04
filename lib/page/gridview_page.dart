import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      body: new GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          new Card(
            child: new Icon(Icons.directions_car),
          ),
          new Card(
            child: new Icon(Icons.directions_car),
          ),
          new Card(
            child: new Icon(Icons.directions_car),
          ),
          new Card(
            child: new Icon(Icons.directions_car),
          ),
          new Card(
            child: new Icon(Icons.directions_car),
          ),
          new Card(
            child: new Icon(Icons.directions_car),
          ),
        ],
      ),
    );
  }
}
