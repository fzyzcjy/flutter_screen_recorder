// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/generated/delegate/paragraph.dart';
import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/record_list.dart';

abstract class MyParagraphBuilderBase {
  final ParagraphBuilder proxy;
  final _data = ParagraphBuilderRecordList(methodCallRecords: []);

  MyParagraphBuilderBase(ParagraphStyle style) : proxy = ParagraphBuilder(style) {
    _data.constructorRecord = ParagraphBuilder_Constructor_Record(style: style);
  }

  void handleOp<T>(T result, ParagraphBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.temporaryClone());
  }

  Paragraph handleBuildOp(Paragraph result) {
    result.paragraphBuilderRecordList = _data;
    return MyParagraph(result);
  }
}

class ParagraphBuilder_Constructor_Record {
  ParagraphBuilder_Constructor_Record({required this.style});

  final ParagraphStyle style;
}

class ParagraphBuilder_RecordExecuteContext {}
