import 'package:flutter/material.dart';
import 'package:screen_recorder/my_canvas.dart';

class ScreenRecorder {
  ScreenRecorder() {
    PaintingContext.createCanvas = (recorder) => MyCanvas(Canvas(recorder));
  }
}
