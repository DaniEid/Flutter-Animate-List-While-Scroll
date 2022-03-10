import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedListScreenState createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  double _topPadding = 15.0;
  final _duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: customAnimatedList,
    );
  }

  _scrollUpdated(ScrollMetrics metrics) {
    setState(() {
      if (_topPadding == 20.0) return;
      _topPadding = 20.0;
    });
  }

  _scrollEnded(ScrollMetrics metrics) {
    setState(() {
      _topPadding = 15.0;
    });
  }

  Widget get customAnimatedList => NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _scrollUpdated(scrollNotification.metrics);
          } else if (scrollNotification is ScrollEndNotification) {
            _scrollEnded(scrollNotification.metrics);
          }
          return true;
        },
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return AnimatedPadding(
              padding: EdgeInsets.only(top: _topPadding),
              duration: _duration,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: index % 2 == 0 ? Colors.black38 : Colors.blue),
                  height: 100,
                  width: 100,
                ),
              ),
            );
          },
        ),
      );
}
