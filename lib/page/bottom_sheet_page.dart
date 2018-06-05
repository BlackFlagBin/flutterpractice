import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  VoidCallback _showPersistentCallBack;

  @override
  void initState() {
    super.initState();
    _showPersistentCallBack = _showPersistentBottomSheet;
  }

  void _showPersistentBottomSheet() {
    setState(() {
      _showPersistentCallBack = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: 300.0,
            color: Colors.red,
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersistentCallBack = _showPersistentBottomSheet;
            });
          }
        });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: 300.0,
            color: Colors.blue,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("BottomSheet"),
      ),
      body: new Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
                width: 100.0,
                child: new RaisedButton(
                  onPressed: _showPersistentCallBack,
                  child: new Text("persistent"),
                )),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Container(
                width: 100.0,
                child: new RaisedButton(
                  onPressed: _showModalBottomSheet,
                  child: new Text("modal"),
                )),
          ],
        ),
      ),
    );
  }
}
