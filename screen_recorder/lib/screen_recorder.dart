import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/my_canvas.dart';

class ScreenRecorder {
  static setup() {
    PaintingContext.createCanvas = (recorder) => MyCanvas(Canvas(recorder));
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      print('PersistentFrameCallback stat=${CanvasStat.instance}');
      CanvasStat.instance = CanvasStat();
    });
  }
}
