import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen_recorder/src/render_screen_player.dart';
import 'package:screen_recorder/src/screen_recorder.dart';
import 'package:screen_recorder/src/touch/touch_listener.dart';

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
    // when `nothing` should not even render the controlling FloatingActionButton below, because those are still
    // text under the hood, and we really need to clean up everything, if we want to make screen_recorder gets
    // completely removed from Flutter
    // https://github.com/fzyzcjy/yplusplus/issues/9620#issuecomment-1603479358
    if (displayMode == _DisplayMode.nothing) {
      return Container();
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          (switch (displayMode) {
            _DisplayMode.originalTree => TouchListener(
                child: widget.child,
              ),
            _DisplayMode.player => const ScreenPlayerWidget(),
            _ => throw UnimplementedError(),
          }),
          Positioned(
            right: 64,
            bottom: 64 * 4,
            child: FloatingActionButton(
              onPressed: () => ScreenRecorder.instance.dumpDebugInfo(verbose: true),
              child: const Icon(Icons.bug_report_outlined),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64 * 3,
            child: FloatingActionButton(
              onPressed: () {
                ScreenRecorder.instance.framePackets.clear();
                _setRecording(value: true);
              },
              child: const Icon(Icons.fiber_manual_record_outlined),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64 * 2,
            child: FloatingActionButton(
              onPressed: () {
                _setRecording(value: false);
                _compressionExperiment();
              },
              child: const Icon(Icons.stop),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64,
            child: FloatingActionButton(
              onPressed: () async {
                if (ScreenRecorder.instance.recording) {
                  await _setRecording(value: false);
                }

                setState(() =>
                    displayMode = displayMode == _DisplayMode.player ? _DisplayMode.originalTree : _DisplayMode.player);
              },
              child: const Icon(Icons.tv_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _compressionExperiment() async {
  // ignore: deprecated_export_use
  final builder = BytesBuilder(copy: false);
  for (final chunk in ScreenRecorder.instance.framePackets) {
    builder.add(chunk);
  }

  final nonCompressedData = builder.takeBytes();
  final defaultCompressedData = ZLibEncoder().convert(nonCompressedData);
  final zlibHardestCompressedData = ZLibEncoder(level: 9, memLevel: 9).convert(nonCompressedData);

  final path =
      '${(await getExternalStorageDirectory())!.path}/NonCompressedBytes_${DateTime.now().toIso8601String().replaceAll(':', '').replaceAll('.', '')}.bin';
  print('write to path=$path');
  await File(path).writeAsBytes(nonCompressedData);

  print('defaultCompressedData=${defaultCompressedData.length} '
      'nonCompressedData=${nonCompressedData.length} '
      'zlibHardestCompressedData=${zlibHardestCompressedData.length}');
}

enum _DisplayMode {
  originalTree,
  nothing,
  player,
}
