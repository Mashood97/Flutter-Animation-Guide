import 'package:flutter/material.dart';

class AnimatedPosition extends StatefulWidget {
  @override
  _AnimatedPositionState createState() => _AnimatedPositionState();
}

class _AnimatedPositionState extends State<AnimatedPosition> {
  bool _showMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: 100,
                width: 300,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'HelloWorld',
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              child: Container(
                width: 100,
                color: Colors.deepOrangeAccent,
              ),
              bottom: _showMessage ? 150 : 10,
              right: 10,
              top: _showMessage ? 10 : 150,
              duration: Duration(seconds: 2),
              curve: Curves.decelerate,
            ),
            updateStateButton(),
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
              //           <-- update state
              _showMessage = true;
            });
          },
        ),
      ),
    );
  }
}
