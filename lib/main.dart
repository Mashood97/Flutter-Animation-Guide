import 'package:flutter/material.dart';
import 'package:flutter_animations/anim/custom_anim.dart';

import 'anim/animatedContainer.dart';
import 'anim/animated_position.dart';
import 'anim/animated_switcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: AnimatedContainerDemo(),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AnimatedPosition(),
                  ),
                );
              },
              child: Text('Animated Position'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AnimatedSwitchers(),
                  ),
                );
              },
              child: Text('Animated Switcher'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AnimatedContainerDemo(),
                  ),
                );
              },
              child: Text('Animated Container'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CustomAnim(),
                  ),
                );
              },
              child: Text('Custom Anim'),
            ),
          ],
        ),
      ),
    );
  }
}
