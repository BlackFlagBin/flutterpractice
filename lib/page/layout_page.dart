import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  LayoutPageState createState() {
    return new LayoutPageState();
  }
}

class LayoutPageState extends State<LayoutPage> with TickerProviderStateMixin {
  TabController _controller;

  Map<String, Widget> _layoutTypeMap = new Map();

  List<Widget> _tabItemList;
  List<Widget> _tabViewList;

  @override
  void initState() {
    super.initState();
    _initLayoutTypeMap();
    _controller = new TabController(length: _layoutTypeMap.length, vsync: this);
  }

  void _initLayoutTypeMap() {
    setState(() {
      _layoutTypeMap.putIfAbsent("SizedBox", () {
        return new SizedBox(
          width: 100.0,
          height: 100.0,
          child: new Container(
            color: Colors.red,
          ),
        );
      });

      _tabItemList = _layoutTypeMap.keys.map((k) {
        return new Text(k);
      }).toList();

      _tabViewList = _layoutTypeMap.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Layout"),
        bottom: new TabBar(
          tabs: _tabItemList,
          controller: _controller,
        ),
      ),
      body: new TabBarView(
        children: _tabViewList,
        controller: _controller,
      ),
    );
  }
}
