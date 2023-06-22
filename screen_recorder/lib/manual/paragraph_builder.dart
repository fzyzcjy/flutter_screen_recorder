// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/records.dart';

typedef ParagraphBuilderRecordList = RecordList<ParagraphBuilder_Constructor_Record, ParagraphBuilder_RecordBase>;

// TODO
ParagraphBuilderRecordList get _data => TODO;

abstract class MyParagraphBuilderBase {
  final ParagraphBuilder proxy;

  MyParagraphBuilderBase(ParagraphStyle style) : proxy = ParagraphBuilder(style) {
    _data.constructorRecord = ParagraphBuilder_Constructor_Record(style: style);
  }

  void handleOp<T>(T result, ParagraphBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.safeClone());
  }
}

class ParagraphBuilder_Constructor_Record {
  ParagraphBuilder_Constructor_Record({required this.style});

  final ParagraphStyle style;
}
