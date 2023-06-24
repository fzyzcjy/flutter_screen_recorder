import 'dart:io';

import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FastScreenRecorderDemoWidget extends StatefulWidget {
  final Widget child;

  const FastScreenRecorderDemoWidget({super.key, required this.child});

  @override
  State<FastScreenRecorderDemoWidget> createState() => _FastScreenRecorderDemoWidgetState();
}

class _FastScreenRecorderDemoWidgetState extends State<FastScreenRecorderDemoWidget> {
  final _recorder = FastScreenRecorder.instance;

  String? path;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            right: 64,
            bottom: 64 * 4,
            child: FloatingActionButton(
              onPressed: () => scale *= 1.2,
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64 * 3,
            child: FloatingActionButton(
              onPressed: () => scale /= 1.2,
              child: const Icon(Icons.remove),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64 * 2,
            child: FloatingActionButton(
              onPressed: () async {
                final screenSize = MediaQuery.sizeOf(context);
                final outputSize = screenSize * scale;

                final dir = '${(await getExternalStorageDirectory())!.path}/fast_screen_recorder_experiment';
                await Directory(dir).create(recursive: true);
                setState(() =>
                    path = '$dir/${DateTime.now().toIso8601String().replaceAll(".", "").replaceAll(":", "")}.mp4');

                print('record to path=$path outputSize=$outputSize');

                await _recorder.start(
                  path: File(path!),
                  outputSize: outputSize,
                  fps: 2,
                  bitrate: 80 * 1000,
                  iFrameInterval: 10,
                );
              },
              child: const Icon(Icons.fiber_manual_record_outlined),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 64,
            child: FloatingActionButton(
              onPressed: () async {
                await _recorder.stop();
              },
              child: const Icon(Icons.stop),
            ),
          ),
        ],
      ),
    );
  }
}
