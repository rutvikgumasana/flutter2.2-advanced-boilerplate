import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  MyBullet({
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
