import 'package:flutter/material.dart';

class SwipeToDeletePage extends StatefulWidget {
  @override
  _SwipeToDeletePageState createState() => _SwipeToDeletePageState();
}

class _SwipeToDeletePageState extends State<SwipeToDeletePage> {
  List<String> _dataList;

  @override
  void initState() {
    super.initState();
    _dataList = new List.generate(25, (index) => "Item list $index");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Swipe To Delete Practice"),
      ),
      body: new ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (context, index) => new Dismissible(
                background: new Container(
                  color: Colors.red,
                ),
                key: new Key(_dataList[index]),
                child: new ListTile(
                  title: new Text(_dataList[index]),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _dataList.removeAt(index);
                  });
                  Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("Item $index is deleted")));
                },
              )),
    );
  }
}
