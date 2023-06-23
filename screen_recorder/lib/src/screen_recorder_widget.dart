import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/src/render_screen_player.dart';
import 'package:screen_recorder/src/screen_recorder.dart';

class ScreenRecorderWidget extends StatefulWidget {
  final Widget child;

  const ScreenRecorderWidget({super.key, required this.child});

  @override
  State<ScreenRecorderWidget> createState() => _ScreenRecorderWidgetState();
}

class _ScreenRecorderWidgetState extends State<ScreenRecorderWidget> {
  var displayMode = _DisplayMode.originalTree;

  Future<void> _setRecording({required bool value}) async {
    // render nothing for one frame, s.t. all intermediate objects, such as MyParagraph, are cleared
    // otherwise, it can error, because for example, MyParagraph needs to be used with MyCanvas while not.
    // #9620
    setState(() => displayMode = _DisplayMode.nothing);

    await SchedulerBinding.instance.endOfFrame;

    ScreenRecorder.instance.recording = value;

    await SchedulerBinding.instance.endOfFrame;

    setState(() => displayMode = _DisplayMode.originalTree);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          (switch (displayMode) {
            _DisplayMode.originalTree => widget.child,
            _DisplayMode.nothing => Container(),
            _DisplayMode.player => const ScreenPlayerWidget(),
          }),
          Positioned(
            right: 64,
            bottom: 64 * 3,
            child: FloatingActionButton(
              onPressed: () => _setRecording(value: true),
              child: const Icon(Icons.fiber_manual_record_outlined),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64 * 2,
            child: FloatingActionButton(
              onPressed: () => _setRecording(value: false),
              child: const Icon(Icons.pause),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64,
            child: FloatingActionButton(
              onPressed: () => setState(() =>
                  displayMode = displayMode == _DisplayMode.player ? _DisplayMode.originalTree : _DisplayMode.player),
              child: const Icon(Icons.tv_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

enum _DisplayMode {
  originalTree,
  nothing,
  player,
}
