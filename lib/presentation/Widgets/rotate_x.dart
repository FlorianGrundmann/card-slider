import 'package:flutter/material.dart';

class RotateX extends StatelessWidget {
  final Widget child;
  final double angle;

  const RotateX({
    Key key,
    this.child,
    this.angle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(angle),
      alignment: Alignment.center,
      child: child,
    );
  }
}
