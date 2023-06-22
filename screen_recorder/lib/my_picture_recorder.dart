import 'dart:ui';

class MyPictureRecorder implements PictureRecorder {
  final PictureRecorder proxy;

  MyPictureRecorder(this.proxy);

  @override
  bool get isRecording => proxy.isRecording;

  @override
  Picture endRecording() {
    return proxy.endRecording();
  }
}
