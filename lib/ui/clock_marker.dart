import 'dart:math';

import 'package:flutter/material.dart';

class CloclSecondsTickerMarker extends StatelessWidget {
  const CloclSecondsTickerMarker({
    super.key,
    required this.radius,
    required this.seconds,
  });
  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
      // because we want all the markers to be centered horizontally and vertically 
      // before we apply our transform
      alignment: Alignment.center,
      transform: Matrix4.identity()
        // The purpose of this is to translate our container back
        // by half of its size
        ..translate(-width / 2, -height / 2)
        // 2 * pi spans the entire circle so here we multiply this by seconds / 60
        // so when seconds == 60 then angle == 2 * pi
        // and when seconds == 30 then angle == pi
        ..rotateZ(2 * pi * (seconds / 60))
        // This what we need to push away all the markers from the center by
        // a quantity of radius - heigt / 2
        ..translate(0.0, radius - height / 2),
      child: Container(
        color: color,
        width: width,
        height: height,
      ),
    );
  }
}
