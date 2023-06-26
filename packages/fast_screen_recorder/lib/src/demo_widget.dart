import 'dart:io';

import 'package:fast_screen_recorder/src/fast_screen_player_widget.dart';
import 'package:fast_screen_recorder/src/fast_screen_recorder_widget.dart';
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
  var _modePlay = false;

  String? lastPathVideo;

  String? lastPathMetadata;

  // var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          _modePlay
              ? FastScreenPlayerWidget(
                  pathVideo: lastPathVideo!,
                  pathMetadata: lastPathMetadata!,
                )
              : FastScreenRecorderWidget(
                  child: widget.child,
                ),
          // Positioned(
          //   left: 64,
          //   bottom: 64 * 4,
          //   child: FloatingActionButton(
          //     onPressed: () => scale *= 1.2,
          //     child: const Icon(Icons.add),
          //   ),
          // ),
          // Positioned(
          //   left: 64,
          //   bottom: 64 * 3,
          //   child: FloatingActionButton(
          //     onPressed: () => scale /= 1.2,
          //     child: const Icon(Icons.remove),
          //   ),
          // ),
          Positioned(
            left: 64,
            bottom: 64 * 3,
            child: FloatingActionButton(
              onPressed: () {
                setState(() => _modePlay = !_modePlay);
              },
              child: const Icon(Icons.tv_outlined),
            ),
          ),
          Positioned(
            left: 64,
            bottom: 64 * 2,
            child: FloatingActionButton(
              onPressed: () async {
                // final screenSize = MediaQuery.sizeOf(context);
                // final outputSize = screenSize * scale;

                final dir = '${(await getExternalStorageDirectory())!.path}/fast_screen_recorder_experiment';
                await Directory(dir).create(recursive: true);
                final stem = '$dir/${DateTime.now().toIso8601String().replaceAll(".", "").replaceAll(":", "")}';
                lastPathVideo = '$stem.mp4';
                lastPathMetadata = '$stem.meta';

                // ignore: avoid_print
                print('record to pathVideo=$lastPathVideo');

                await _recorder.start(
                  pathVideo: lastPathVideo!,
                  pathMetadata: lastPathMetadata!,
                );
              },
              child: const Icon(Icons.fiber_manual_record_outlined),
            ),
          ),
          Positioned(
            left: 64,
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
