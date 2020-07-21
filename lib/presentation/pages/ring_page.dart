import 'package:card_slider/presentation/Widgets/rotate_y.dart';
import 'package:card_slider/presentation/Widgets/translate.dart';
import 'package:flutter/material.dart';

import '../../domain/services/card_angles.dart';
import '../Widgets/poro_card.dart';

class RingPage extends StatelessWidget {
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
          scrollDirection: Axis.horizontal,
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
        double translation;
        double z;
        if (_pageController.position.haveDimensions) {
          angle = geometry.calculatePageAngle(index, _pageController.page);
          translation = geometry.getTranslation(index, _pageController.page);
          z = geometry.getScale(index, _pageController.page);
        } else {
          angle = geometry.calculatePageAngle(index);
          translation = geometry.getTranslation(index);
          z = geometry.getScale(index);
        }

        return Padding(
          padding: EdgeInsets.all(z),
          child: Translate(
            x: translation,
            child: RotateY(
              child: child,
              angle: angle,
            ),
          ),
        );
      },
      child: PoroCard(
        index,
        globalKey: GlobalKey<PoroCardState>(),
      ),
    );
  }
}
