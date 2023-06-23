import 'package:flutter/material.dart';
import 'package:screen_recorder/src/screen_recorder.dart';
import 'package:screen_recorder/src/touch/touch_data.dart';

class TouchListener extends StatelessWidget {
  final Widget child;

  const TouchListener({super.key, required this.child});

  TouchPerFrameData get _data => ScreenRecorder.instance.touchPerFrameData;

  void _handlePointer(PointerEvent e) => _data.positions.add(e.position);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePointer,
      onPointerMove: _handlePointer,
      child: child,
    );
  }
}
