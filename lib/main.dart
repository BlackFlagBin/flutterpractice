import 'package:flutter/material.dart';
import 'package:flutterpractice/page/bottom_navigation_bar_page.dart';
import 'package:flutterpractice/page/calculator_practice_page.dart';
import 'package:flutterpractice/page/collapsing_tool_bar_page.dart';
import 'package:flutterpractice/page/gridview_page.dart';
import 'package:flutterpractice/page/layout_page.dart';
import 'package:flutterpractice/page/step_page.dart';
import 'package:flutterpractice/page/tab_page.dart';
import 'package:flutterpractice/page/video_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePartPage(),
      routes: {
        "Bottom Navigation Bar": (context) => new BottomNavigationBarPage(),
        "GridView": (context) => new GridViewPage(),
        "Tab": (context) => new TabPage(),
        "Step": (context) => new StepPage(),
        "Layout": (context) => new LayoutPage(),
        "Video": (context) => new VideoPage(),
        "CollapsingToolBar": (context) => new CollapsingToolBarPage(),
        "Calculator Practice": (context) => new CalculatorPracticePage(),
      },
    );
  }
}

class HomePartPage extends StatefulWidget {
  @override
  _HomePartPageState createState() => new _HomePartPageState();
}

class _HomePartPageState extends State<HomePartPage> {
  var _demoList = [];

  @override
  void initState() {
    super.initState();

    _demoList.add("Bottom Navigation Bar");
    _demoList.add("GridView");
    _demoList.add("Tab");
    _demoList.add("Step");
    _demoList.add("Layout");
    _demoList.add("Video");
    _demoList.add("CollapsingToolBar");
    _demoList.add("Calculator Practice");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Practice"),
      ),
      body: new ListView.builder(
          itemCount: _demoList.length,
          itemBuilder: (context, index) {
            return new Card(
              child: new ListTile(
                title: new Text(_demoList[index]),
                onTap: () {
                  Navigator.of(context).pushNamed(_demoList[index]);
                },
              ),
            );
          }),
    );
  }
}
