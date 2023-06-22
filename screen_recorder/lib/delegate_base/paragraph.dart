// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/generated/delegate/paragraph.dart';

abstract class MyParagraphBase {
  final Paragraph proxy;

  MyParagraphBase(this.proxy) {
    proxy.paragraphRecord = ParagraphRecord();
  }

  void handleLayoutOp(ParagraphConstraints constraints) {
    proxy.paragraphRecord!.layoutConstraints = constraints;
  }
}

class ParagraphRecord {
  ParagraphConstraints? layoutConstraints;

  ParagraphRecord({
    this.layoutConstraints,
  });
}

extension ExtParagraph on Paragraph {
  Paragraph get nativeParagraph {
    final that = this;
    if (that is MyParagraph) return that.proxy;
    return that;
  }
}

class Paragraph_RecordExecuteContext {}
