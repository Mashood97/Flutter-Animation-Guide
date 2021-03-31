import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  // state variables                           <-- state
  final _myDuration = Duration(seconds: 1);
  var _myValue = 100.0;
  final _myNewValue = 75.0;
  final _myValueHeights = 200.0;
  final _myNewValueWidths = 200.0;
  final _newColor = Colors.deepOrange;

  //change values
  var _myValueHeight = 75.0;
  var _myNewValueWidth = 75.0;
  var _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_myValueHeight),
                ),
                height: _myValueHeight,
                width: _myNewValueWidth,
                transform: Matrix4.skew(_myValue, _myValue),
                curve: Curves.slowMiddle,
                duration: _myDuration,
                child:
                    SomeOtherWidget(_color, _myValueHeight, _myNewValueWidth),
              ),
            ),
            updateStateButton()
          ],
        ),
      ),
    );
  }

  Align updateStateButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: ElevatedButton(
          child: Text('Update State'),
          onPressed: () {
            setState(() {
              //                    <-- update state
              _myValue = _myNewValue + 275;
              _myValueHeight = _myValueHeights + 275;
              _myNewValueWidth = _myNewValueWidths + 275;
              _color = _newColor;
            });
          },
        ),
      ),
    );
  }
}

class SomeOtherWidget extends StatelessWidget {
  final color;
  final height, width;

  SomeOtherWidget(this.color, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height),
        ),
        color: color,
      ),
    );
  }
}
