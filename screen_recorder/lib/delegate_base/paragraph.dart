import 'dart:ui';

import 'package:screen_recorder/expandos.dart';

abstract class MyParagraphBase {
  final Paragraph proxy;

  MyParagraphBase(this.proxy) {
    proxy.paragraphRecord = ParagraphRecord();
  }

  void handleLayoutOp(ParagraphConstraints constraints) {
    proxy.paragraphRecord!.constraints = constraints;
  }
}

class ParagraphRecord {
  ParagraphConstraints? constraints;

  ParagraphRecord({
    this.constraints,
  });
}
