import 'package:flutter/material.dart';

class RotateY extends StatelessWidget {
  final Widget child;
  final double angle;

  const RotateY({
    Key key,
    this.child,
    this.angle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(angle),
      alignment: Alignment.center,
      child: child,
    );
  }
}
