import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'stopwatch_rendrer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;
  @override
  void initState() {
    _ticker = createTicker(
      (elapsed) {
        setState(() {
          _elapsed = elapsed;
        });
      },
    );
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final radius = constrains.maxWidth / 2;
        return StopwatchRenderer(
          elapsed: _elapsed,
          radius: radius,
        );
      },
    );
  }
}
