import 'package:flutter/material.dart';

class FeatureDiscoveryPracticePage extends StatefulWidget {
  @override
  _FeatureDiscoveryPracticePageState createState() =>
      _FeatureDiscoveryPracticePageState();
}

class _FeatureDiscoveryPracticePageState
    extends State<FeatureDiscoveryPracticePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var overlayEntry = new OverlayEntry(builder: (context) {
      return new CenterAbout(
        offset: new Offset(200.0, 400.0),
        child: new Container(
          width: 50.0,
          height: 50.0,
          decoration: new BoxDecoration(boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: new Offset(0.0, 1.0),
            )
          ], shape: BoxShape.circle, color: Colors.lightBlue),
        ),
      );
    });
    addToOverlay(overlayEntry);
  }

  void addToOverlay(OverlayEntry overlayEntry) async {
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: new Content(),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add), onPressed: () {}),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new Column(
        children: <Widget>[
          new Image.network(
            "https://globalassets.starbucks.com/assets/0cefdcd3686c4d2ab976ccbe7c42c486.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          new Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.all(15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "StarBuck Coffee",
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.only(top: 10.0)),
                new Text(
                  "StartBuck Shop",
                  style: new TextStyle(color: Colors.white, fontSize: 15.0),
                )
              ],
            ),
          ),
          new Container(
            width: double.infinity,
            height: 60.0,
            padding: const EdgeInsets.all(10.0),
            child: new RaisedButton(
              color: Colors.lightBlue,
              onPressed: () {},
              child: new Text(
                "go to discovery",
                style: new TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      new Positioned(
          top: 200.0,
          right: 0.0,
          child: new FractionalTranslation(
            translation: new Offset(-0.5, -0.5),
            child: new FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                child: new Icon(Icons.local_drink),
                onPressed: () {}),
          )),
    ]);
  }
}

class CenterAbout extends StatefulWidget {
  final Offset offset;

  final Widget child;

  CenterAbout({this.offset, this.child});

  @override
  _CenterAboutState createState() => _CenterAboutState();
}

class _CenterAboutState extends State<CenterAbout> {
  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: widget.offset.dy,
        left: widget.offset.dx,
        child: new FractionalTranslation(
            translation: new Offset(-0.5, -0.5), child: widget.child));
  }
}
