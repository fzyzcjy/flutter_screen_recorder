// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:screen_recorder/src/generated/record/canvas.dart';
import 'package:screen_recorder/src/my_picture_recorder.dart';
import 'package:screen_recorder/src/record_list.dart';

abstract class MyCanvasBase {
  final Canvas proxy;
  final data = CanvasRecordList(methodCallRecords: []);

  MyCanvasBase(MyPictureRecorder recorder) : proxy = Canvas(recorder.proxy) {
    recorder.myCanvas = this;
  }

  void handleOp<T>(T result, Canvas_RecordBase<Object?> record) {
    data.methodCallRecords.add(record.temporaryClone());
  }
}

class Canvas_RecordExecuteContext {}
