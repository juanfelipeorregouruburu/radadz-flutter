import 'package:flutter/material.dart';

class CircleView extends StatelessWidget {
  final double size;
  final Color color;

  const CircleView({
    Key key,
    @required this.size,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}