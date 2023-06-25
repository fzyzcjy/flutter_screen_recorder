import 'package:fast_screen_recorder/src/interaction/interaction_recorder.dart';
import 'package:flutter/material.dart';

class FastScreenRecorderWidget extends StatelessWidget {
  final Widget child;

  const FastScreenRecorderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return InteractionRecorderWidget(
      child: child,
    );
  }
}
