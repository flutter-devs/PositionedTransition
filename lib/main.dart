import 'package:flutter/material.dart';
import 'package:positioned_transition/ui/positioned_transition_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PositionedTransition',
      home: PositionedTransitionScreen(),
    );
  }
}
