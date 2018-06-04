import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => new _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tab"),
        bottom: new TabBar(
          tabs: [
            new Icon(Icons.account_circle),
            new Icon(Icons.map),
            new Icon(Icons.http),
            new Icon(Icons.https)
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        children: [
          new Center(
            child: new Text("First"),
          ),
          new Center(
            child: new Text("Second"),
          ),
          new Center(
            child: new Text("Third"),
          ),
          new Center(
            child: new Text("Fourth"),
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}
