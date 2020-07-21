import 'package:flutter/material.dart';

class PoroCard extends StatefulWidget {
  final int index;
  final double scale;
  final GlobalKey globalKey;

  PoroCard(this.index, {this.globalKey, this.scale}) : super(key: globalKey);

  @override
  PoroCardState createState() => PoroCardState(scale);
}

class PoroCardState extends State<PoroCard> {
  final List<String> _imageNames = [
    'assets/images/01FR008.png',
    'assets/images/01FR008T1.png',
    'assets/images/01FR053.png',
    'assets/images/01DE049.png',
    'assets/images/01IO005.png',
  ];

  double scale1;

  PoroCardState(this.scale1);

  void setScale(double scale) {
    setState(() {
      scale1 = scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        _imageNames[widget.index],
        scale: scale1,
      ),
    );
  }
}
