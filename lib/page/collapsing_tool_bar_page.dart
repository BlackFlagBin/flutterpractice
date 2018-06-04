import 'package:flutter/material.dart';

class CollapsingToolBarPage extends StatefulWidget {
  @override
  _CollapsingToolBarPageState createState() => _CollapsingToolBarPageState();
}

class _CollapsingToolBarPageState extends State<CollapsingToolBarPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 150.0,
            pinned: false,
            floating: false,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text("Title"),
            ),
          ),
          new SliverList(
              delegate: new SliverChildBuilderDelegate((context, index) {
            return new ListTile(
              title: new Text("List item $index"),
            );
          }))
        ],
      ),
    );
  }
}
