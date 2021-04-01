import 'package:flutter/material.dart';

class GridAnimation extends StatefulWidget {
  @override
  _GridAnimationState createState() => _GridAnimationState();
}

class _GridAnimationState extends State<GridAnimation> {
  final kheightWidth = 500.0;
  var changedHeightWidth = 200.0;
  final kColor = Colors.deepOrangeAccent.shade100;

  final crossAxisCount = 2;
  final crossAxisSpacing = 10.0;
  final mainAxisSpacing = 10.0;
  var childAspectRatio = 3 / 2;

  List _list = [
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
    {
      'title': 'Hello',
      'heightwidth': 200.0,
      'color': Colors.amber.shade100,
      'childratio': 1.0,
    },
  ];
  int _selectedIndex;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: _list.length,
          itemBuilder: (ctx, index) => GestureDetector(
            onTap: () {
              _onSelected(index);
              setState(() {
                _list[index]['heightwidth'] = kheightWidth;
                // childAspectRatio = _list[index]['childratio'];
              });
            },
            child: AnimatedContainer(
              duration: Duration(
                seconds: 0,
              ),
              curve: Curves.linearToEaseOut,
              height: _list[index]['heightwidth'],
              width: _list[index]['heightwidth'],
              transform: _selectedIndex == index
                  ? Matrix4.skew(0.5, -0.0)
                  : Matrix4.skew(0.0, -0.0),
              child: Card(
                color: _selectedIndex == index ? kColor : _list[index]['color'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
