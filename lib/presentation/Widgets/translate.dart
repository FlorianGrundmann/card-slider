import 'package:flutter/material.dart';

class Translate extends StatelessWidget {
  final Widget child;
  final double x;
  final double y;

  const Translate({
    Key key,
    @required this.child,
    this.x = 0.0,
    this.y = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(x, y, 0.0),
      child: child,
    );
  }
}
