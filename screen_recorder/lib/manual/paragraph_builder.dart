import 'dart:ui';

import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/records.dart';

// TODO
RecordList<ParagraphBuilder_RecordBase> get _data => TODO;

abstract class MyParagraphBuilderBase {
  final ParagraphBuilder proxy;

  MyParagraphBuilderBase(ParagraphStyle style) : proxy = ParagraphBuilder(style);

  void handleOp<T>(T result, ParagraphBuilder_RecordBase<Object?> record) {
    _data.records.add(record.safeClone());
  }
}
