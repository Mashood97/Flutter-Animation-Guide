import 'package:flutter/material.dart';

class CustomAnim extends StatefulWidget {
  @override
  _CustomAnimState createState() => _CustomAnimState();
}

class _CustomAnimState extends State<CustomAnim> {
  final _scrollController = ScrollController();
  var _heightchange = 350.0;
  var height = 200.0;
  dynamic _shape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
  double radius = 10;
  double changeRadius = 50.0;
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      setState(() {
        height = _heightchange;
        // _shape = StadiumBorder(side: BorderSide.none);
        radius = changeRadius;
      });
    });
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (scrollEnd) {
            var metrics = scrollEnd.metrics;

            if (metrics.atEdge) {
              if (metrics.pixels == 0) {
                print('At top');
                setState(() {
                  height = 200;
                  // _shape = RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0));
                  radius = 10.0;
                });
              } else {
                setState(() {
                  height = 200;
                  // _shape = RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0));
                  radius = 10.0;
                });
              }

              print('At bottom');
            }
            return true;
          },
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            physics: PageScrollPhysics(),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.all(25.0),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  AnimatedContainer(
                    height: height,
                    width: height,
                    duration: Duration(seconds: 2),
                    curve: Curves.decelerate,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius)),
                      color: Colors.green,
                      margin: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                          height: 100.0,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 45.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Foo",
                                  style: Theme.of(context).textTheme.subhead,
                                ),
                                Text("bar")
                              ],
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: -20.0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 30.0,
                        child: Text("D"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
// Center(
// child:
// ),
