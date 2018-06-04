import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      new _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  var _currentIndex = 0;

  var _pageList = <Widget>[];

  var _pageStorageBucket = new PageStorageBucket();

  var _firstBarKey = new PageStorageKey("FirstBar");
  var _secondBarKey = new PageStorageKey("SecondBar");

  @override
  void initState() {
    super.initState();
    setState(() {
      _pageList.add(new FirstBarPage(_firstBarKey));
      _pageList.add(new SecondBarPage(_secondBarKey));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bottom Navigation Bar"),
      ),
      body: new PageStorage(
          bucket: _pageStorageBucket, child: _pageList[_currentIndex]),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.directions_bike),
                title: new Text("First Bar")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.directions_car),
                title: new Text("Second Bar")),
          ]),
    );
  }
}

class FirstBarPage extends StatefulWidget {
  FirstBarPage(PageStorageKey<String> firstBarKey) : super(key: firstBarKey);

  @override
  _FirstBarPageState createState() => new _FirstBarPageState();
}

class _FirstBarPageState extends State<FirstBarPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("First Bar"),
    );
  }
}

class SecondBarPage extends StatefulWidget {
  SecondBarPage(PageStorageKey<String> secondBarKey) : super(key: secondBarKey);

  @override
  _SecondBarPageState createState() => new _SecondBarPageState();
}

class _SecondBarPageState extends State<SecondBarPage> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemExtent: 250.0,
        itemBuilder: (context, index) => new Container(
              padding: const EdgeInsets.all(10.0),
              child: new Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),
                color: index % 2 == 0 ? Colors.blue : Colors.orange,
                child: new Center(
                  child: new Text(
                    "$index",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ));
  }
}
