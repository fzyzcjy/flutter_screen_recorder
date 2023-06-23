import 'package:flutter/material.dart';
import 'package:screen_recorder/src/render_screen_player.dart';
import 'package:screen_recorder/src/screen_recorder.dart';

class ScreenRecorderWidget extends StatefulWidget {
  final Widget child;

  const ScreenRecorderWidget({super.key, required this.child});

  @override
  State<ScreenRecorderWidget> createState() => _ScreenRecorderWidgetState();
}

class _ScreenRecorderWidgetState extends State<ScreenRecorderWidget> {
  var showPlayer = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          showPlayer
              ? const ScreenPlayerWidget()
              : KeyedSubtree(
                  // when switch recording, try to refresh the whole subtree to avoid using MyParagraph + (naive) Canvas causing errors
                  key: ValueKey(ScreenRecorder.instance.recording),
                  child: widget.child,
                ),
          Positioned(
            right: 64,
            bottom: 64 * 3,
            child: FloatingActionButton(
              // need to (hacky) setState, b/c we rely on this in KeyedSubtree...
              // Anyway should use a state management solution later
              onPressed: () => setState(() => ScreenRecorder.instance.recording = true),
              child: const Icon(Icons.fiber_manual_record_outlined),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64 * 2,
            child: FloatingActionButton(
              onPressed: () => setState(() => ScreenRecorder.instance.recording = false),
              child: const Icon(Icons.pause),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64,
            child: FloatingActionButton(
              onPressed: () => setState(() => showPlayer = !showPlayer),
              child: const Icon(Icons.tv_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
