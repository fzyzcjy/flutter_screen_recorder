import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/my_canvas.dart';
import 'package:screen_recorder/my_paragraph_builder.dart';

class ScreenRecorder {
  static setup() {
    PaintingContext.createCanvas = (recorder) => MyCanvas(Canvas(recorder));
    TextPainter.createParagraphBuilder = (style) => MyParagraphBuilder(style);

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
          'DataPerFrame=${DataPerFrame.instance}');

      overallUncompressedBytesLen += DataPerFrame.instance.bytes.len;
      overallUncompressedBytes.add(DataPerFrame.instance.bytes.dataView());

      DataPerFrame.instance = DataPerFrame();
    });
  }
}
