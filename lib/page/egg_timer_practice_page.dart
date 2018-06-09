import 'dart:math';

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
              child: new Stack(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(65.0),
                    child: new TimerKnob(),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(55.0),
                    width: double.infinity,
                    height: double.infinity,
                    child: new CustomPaint(
                      painter: new TimeTicker(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeTicker extends CustomPainter {
  final LONG_TICK = 14.0;
  final SHORT_TICK = 4.0;

  final tickCount;
  final tickPerSection;
  final tickInset;
  Paint tickPainter;
  TextPainter textPainter;
  TextStyle textStyle;

  TimeTicker(
      {this.tickCount = 35, this.tickPerSection = 5, this.tickInset = 0.0})
      : tickPainter = new Paint(),
        textPainter = new TextPainter(
            textAlign: TextAlign.center, textDirection: TextDirection.ltr),
        textStyle = new TextStyle(
            color: Colors.black, fontSize: 20.0, fontFamily: "BebasNeue") {
    tickPainter.style = PaintingStyle.stroke;
    tickPainter.strokeWidth = 1.5;
    tickPainter.color = Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.save();
    double radius = size.height / 2;
    for (int i = 0; i < tickCount; i++) {
      double tickLength = i % tickPerSection == 0 ? LONG_TICK : SHORT_TICK;
      canvas.drawLine(new Offset(0.0, -radius),
          new Offset(0.0, -tickLength - radius), tickPainter);

      if (i % tickPerSection == 0) {
        canvas.save();
        canvas.translate(0.0, -radius - 30);
        textPainter.text = new TextSpan(text: "$i", style: textStyle);
        textPainter.layout();
        var tickPercent = i / tickCount;
        var quadrant;
        if (tickPercent < 0.25) {
          quadrant = 1;
        } else if (tickPercent < 0.5) {
          quadrant = 4;
        } else if (tickPercent < 0.75) {
          quadrant = 3;
        } else {
          quadrant = 2;
        }
        switch (quadrant) {
          case 1:
            break;
          case 4:
            canvas.rotate(-pi / 2);
            break;
          case 2:
            break;
          case 3:
            canvas.rotate(pi / 2);
            break;
        }
        textPainter.paint(canvas,
            new Offset(-textPainter.width / 2, -textPainter.height / 2));
        canvas.restore();
      }
      canvas.rotate(2 * pi / tickCount);
    }

    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TimerKnob extends StatelessWidget {
  const TimerKnob({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          width: double.infinity,
          height: double.infinity,
          child: new CustomPaint(
            painter: new ArrowPainter(),
          ),
        ),
        new AspectRatio(
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
        )
      ],
    );
  }
}

class ArrowPainter extends CustomPainter {
  Paint _dialArrowPaint;

  ArrowPainter() {
    _dialArrowPaint = new Paint();
    _dialArrowPaint.color = Colors.black;
    _dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, 0.0);
    var path = new Path();
    path.moveTo(0.0, -10.0);
    path.lineTo(5.0, 0.0);
    path.lineTo(-5.0, 0.0);
    path.close();
    canvas.drawPath(path, _dialArrowPaint);
    canvas.drawShadow(path, Colors.black, 3.0, false);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
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
