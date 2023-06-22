import 'dart:ui';

import 'package:screen_recorder/generated/record/canvas.dart';
import 'package:screen_recorder/records.dart';

// TODO should be an expando to PictureBuilder / Picture / whatever?
RecordList<Canvas_RecordBase> get _data => TODO;

abstract class MyCanvasBase {
  final Canvas proxy;

  MyCanvasBase(PictureRecorder recorder) : proxy = Canvas(recorder);

  void handleOp<T>(T result, Canvas_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.safeClone());
  }
}
