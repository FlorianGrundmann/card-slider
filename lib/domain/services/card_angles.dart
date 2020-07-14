import 'dart:math';

class CardAngles {
  static const double _lowerLimit = 0.0;
  static const double _upperLimit = pi / 2 - 0.2;

  double calculatePageAngle(double position, int pageIndex,
      [int initialPageIndex = 0]) {
    double angle;

    angle = position - pageIndex;

    angle = (angle.abs() * _upperLimit).clamp(_lowerLimit, _upperLimit);
    angle *= -1;

    return angle;
  }

  double getInitialAngles(int pageIndex, [int initialPageIndex = 0]) {
    if (pageIndex == initialPageIndex) {
      return -1 * _lowerLimit;
    } else {
      return -1 * (_upperLimit - _lowerLimit);
      //return -1 * _upperLimit;
    }
  }
}
