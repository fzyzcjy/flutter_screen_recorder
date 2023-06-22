import 'dart:ui';

abstract class MyParagraphBase {
  final Paragraph proxy;

  MyParagraphBase(this.proxy);

  void handleLayoutOp(ParagraphConstraints constraints) {
    TODO;
  }
}
