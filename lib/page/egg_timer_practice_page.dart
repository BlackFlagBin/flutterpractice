import 'package:flutter/material.dart';

final Color GRADIENT_TOP = const Color(0xfff5f5f5);
final Color GRADIENT_BOTTOM = const Color(0xffe8e8e8);

class EggTimerPracticePage extends StatefulWidget {
  @override
  _EggTimerPracticePageState createState() => _EggTimerPracticePageState();
}

class _EggTimerPracticePageState extends State<EggTimerPracticePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [GRADIENT_TOP, GRADIENT_BOTTOM])),
        child: new Center(
            child: new Column(
          children: <Widget>[
            new TimeDisplay(),
            new TimeDial(),
            new Expanded(child: new Container()),
            new TimeControl(),
          ],
        )),
      ),
    );
  }
}

class TimeDial extends StatelessWidget {
  const TimeDial({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new Padding(
        padding: const EdgeInsets.all(30.0),
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [GRADIENT_TOP, GRADIENT_BOTTOM]),
                boxShadow: [
                  new BoxShadow(
                      color: const Color(0x44000000),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 1.0))
                ]),
            child: new Container(
              width: double.infinity,
              child: new Padding(
                padding: const EdgeInsets.all(65.0),
                child: new AspectRatio(
                  aspectRatio: 1.0,
                  child: new Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: new LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [GRADIENT_TOP, GRADIENT_BOTTOM]),
                        boxShadow: [
                          new BoxShadow(
                              color: const Color(0x44000000),
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0.0, 1.0))
                        ]),
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: new Border.all(
                                width: 1.5, color: const Color(0xffdfdfdf))),
                        child: new Icon(
                          Icons.access_time,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeControl extends StatelessWidget {
  const TimeControl({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new TimeButton("RESTART", Icons.refresh),
            new Expanded(
              child: new Container(),
            ),
            new TimeButton("RESET", Icons.arrow_back)
          ],
        ),
        new TimeButton("PAUSE", Icons.pause)
      ],
    );
  }
}

class TimeButton extends StatelessWidget {
  final String _text;
  final IconData _icon;

  TimeButton(this._text, this._icon);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        splashColor: new Color(0x22000000),
        onPressed: () {},
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: new Icon(_icon),
              ),
              new Text(
                _text,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontSize: 20.0),
              )
            ],
          ),
        ));
  }
}

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: new Text(
        "15:30",
        textAlign: TextAlign.center,
        style: new TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
            fontFamily: "BebasNeue",
            fontSize: 100.0),
      ),
    );
  }
}
