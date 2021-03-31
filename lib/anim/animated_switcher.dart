import 'package:flutter/material.dart';

class AnimatedSwitchers extends StatefulWidget {
  @override
  _AnimatedSwitcherState createState() => _AnimatedSwitcherState();
}

class _AnimatedSwitcherState extends State<AnimatedSwitchers> {
  Widget _myWidet = RowsContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            reverseDuration: const Duration(seconds: 2),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              child: child,
              scale: animation,
            ),
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.fastLinearToSlowEaseIn,
            child: _myWidet,
          ),
          updateStateButton(),
        ],
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
              _myWidet = ColumnContainer();
            });
          },
        ),
      ),
    );
  }
}

class RowsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 300,
              padding: EdgeInsets.all(20),
              width: 200,
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              height: 300,
              width: 200,
              padding: EdgeInsets.all(20),
              color: Colors.amber,
            ),
          ),
          Expanded(
            child: Container(
              height: 300,
              width: 200,
              padding: EdgeInsets.all(20),
              color: Colors.deepOrangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.green,
              padding: EdgeInsets.all(20),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.amber,
              padding: EdgeInsets.all(20),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.deepOrangeAccent,
              padding: EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}
