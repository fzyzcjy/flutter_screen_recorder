import 'dart:ui';

import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/records.dart';

// TODO
RecordList<ParagraphBuilder_RecordBase> get _data => TODO;

mixin MyParagraphBuilderMixin {
  ParagraphBuilder get proxy;

  void handleOp<T>(T result, ParagraphBuilder_RecordBase<Object?> record) {
    _data.records.add(record.safeClone());
  }
}
