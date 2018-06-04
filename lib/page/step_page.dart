import 'package:flutter/material.dart';

class StepPage extends StatefulWidget {
  @override
  _StepPageState createState() => new _StepPageState();
}

class _StepPageState extends State<StepPage> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentStep = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Step"),
      ),
      body: new Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: () {
            setState(() {
              if (_currentStep + 1 == 4) {
                _currentStep = 3;
              } else {
                _currentStep++;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep - 1 == -1) {
                _currentStep = 0;
              } else {
                _currentStep--;
              }
            });
          },
          onStepTapped: (index) {
            setState(() {
              _currentStep = index;
            });
          },
          steps: [
            new Step(
                title: new Text("STEP 1"),
                content: new Icon(Icons.save),
                isActive: true,
                state: StepState.indexed),
            new Step(
                title: new Text("STEP 2"),
                content: new Icon(Icons.save),
                isActive: true),
            new Step(
                title: new Text("STEP 3"),
                content: new Icon(Icons.save),
                isActive: true),
            new Step(
                title: new Text("STEP 4"),
                content: new Icon(Icons.save),
                isActive: true),
          ]),
    );
  }
}
