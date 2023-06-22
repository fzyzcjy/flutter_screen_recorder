import 'dart:ui';

import 'package:screen_recorder/delegate_base/canvas.dart';
import 'package:screen_recorder/expandos.dart';

class MyPictureRecorder implements PictureRecorder {
  final PictureRecorder proxy;

  // Indeed, [PictureRecorder] already has [_canvas] field, but we cannot access it
  MyCanvasBase? myCanvas;

  MyPictureRecorder(this.proxy);

  @override
  bool get isRecording => proxy.isRecording;

  @override
  Picture endRecording() {
    final result = proxy.endRecording();
    result.record = myCanvas!.data;
    return result;
  }
}
