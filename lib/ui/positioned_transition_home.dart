import 'package:flutter/material.dart';

class PositionedTransitionScreen extends StatefulWidget {
  const PositionedTransitionScreen({Key? key}) : super(key: key);

  @override
  _PositionedTransitionScreenState createState() => _PositionedTransitionScreenState();
}

class _PositionedTransitionScreenState extends State<PositionedTransitionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Container _container() {
    return Container(
        child:  GestureDetector(
            onTap: () {
              if(_controller.isCompleted){
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: FlutterLogo())
    );
  }

  @override
  Widget build(BuildContext context) {
    double smallSize = 80;
    double largeSize = MediaQuery.of(context).size.width;
    final Size screenSize = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                  Rect.fromLTWH(30, 100, smallSize, smallSize), screenSize),
              end: RelativeRect.fromSize(
                  Rect.fromLTWH(0, screenSize.height / 2.4, largeSize, 150),
                  screenSize),
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInToLinear,
            )),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: _container(),
            ),
          ),
        ],
      ),
    );
  }
}