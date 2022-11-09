import 'dart:math';

import 'package:flutter/material.dart';

import 'clock_hand.dart';
import 'clock_marker.dart';
import 'elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  const StopwatchRenderer({
    super.key,
    required this.elapsed,
    required this.radius,
  });

  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          CloclSecondsTickerMarker(seconds: i, radius: radius),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            color: Colors.orange,
            handLength: radius,
            handThickness: 2.0,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
