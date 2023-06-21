import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/my_canvas.dart';

class ScreenRecorder {
  static setup() {
    PaintingContext.createCanvas = (recorder) => MyCanvas(Canvas(recorder));

    var overallUncompressedBytesLen = 0;
    var overallCompressedBytesLen = 0;

    final overallUncompressedBytes = StreamController<List<int>>();
    overallUncompressedBytes //
        .stream
        .transform(GZipCodec().encoder)
        .listen((bytes) => overallCompressedBytesLen += bytes.length);

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      print('PersistentFrameCallback '
          'overallUncompressedBytesLen=$overallCompressedBytesLen '
          'overallCompressedBytesLen=$overallCompressedBytesLen '
          'frameInfo=${CanvasFrameInfo.instance}');

      overallUncompressedBytesLen += CanvasFrameInfo.instance.bytes.len;
      overallUncompressedBytes.add(CanvasFrameInfo.instance.bytes.dataView());

      CanvasFrameInfo.instance = CanvasFrameInfo();
    });
  }
}
