import 'dart:math';

class CardAngles {
  static const double _upperLimit = 0.7;
  static const double _baseTranslation = 100.0;
  static const double _minZoom = 3.0;
  static const double _baseZoom = 20.0;

  double calculatePageAngle(
    int pageIndex, [
    double position,
    bool turnback = false,
    bool concave = false,
    int initialPageIndex = 0,
  ]) {
    double angle;

    position = position ?? initialPageIndex.toDouble();
    angle = position - pageIndex;

    if (turnback) {
      angle = angle.abs();
    }

    angle = (angle * _upperLimit).clamp(-_upperLimit, _upperLimit);
    if (concave) {
      angle *= -1;
    }

    return angle;
  }

  double getTranslation(int pageIndex,
      [double position, int initialPageIndex = 0]) {
    position = position ?? initialPageIndex.toDouble();
    return (position - pageIndex) * _baseTranslation;
  }

  double getScale(int pageIndex, [double position, int initialPageIndex = 0]) {
    position = position ?? initialPageIndex.toDouble();
    return pow((position - pageIndex).abs(), 3) * _baseZoom + _minZoom;
  }
}
