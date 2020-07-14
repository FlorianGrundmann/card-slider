import 'package:flutter/material.dart' hide Card;

import '../../domain/services/card_angles.dart';
import '../Widgets/card.dart';
import '../Widgets/rotate_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(
    viewportFraction: 0.5,
  );
  final CardAngles geometry = CardAngles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) => _builder(index),
        ),
      ),
    );
  }

  _builder(int index, [int initialPage = 0]) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double angle;
        if (_pageController.position.haveDimensions) {
          angle = geometry.calculatePageAngle(_pageController.page, index);
        } else {
          angle = geometry.getInitialAngles(index);
        }
        return RotateX(child: child, angle: angle);
      },
      child: Card(index),
    );
  }
}
