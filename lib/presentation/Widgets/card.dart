import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final List<Image> _images = [
    Image.asset('assets/images/01FR008.png'),
    Image.asset('assets/images/01FR008T1.png'),
    Image.asset('assets/images/01FR053.png'),
    Image.asset('assets/images/01DE049.png'),
    Image.asset('assets/images/01IO005.png'),
  ];

  final int index;

  Card(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _images[index];
  }
}
