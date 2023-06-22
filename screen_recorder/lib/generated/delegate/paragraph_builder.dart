// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/manual/paragraph_builder.dart';

class MyParagraphBuilder with MyParagraphBuilderMixin implements ParagraphBuilder {
  @override
  final ParagraphBuilder proxy;

  MyParagraphBuilder(this.proxy);

  @override
  int get placeholderCount {
    final result = proxy.placeholderCount;
    handleOp(result);
    return result;
  }

  @override
  List<double> get placeholderScales {
    final result = proxy.placeholderScales;
    handleOp(result);
    return result;
  }

  @override
  void pushStyle(TextStyle style) {
    final result = proxy.pushStyle(style);
    final record = ParagraphBuilder_PushStyle_Record(style: style);
    handleOp(result, record);
    return result;
  }

  @override
  void pop() {
    final result = proxy.pop();
    final record = ParagraphBuilder_Pop_Record();
    handleOp(result, record);
    return result;
  }

  @override
  void addText(String text) {
    final result = proxy.addText(text);
    final record = ParagraphBuilder_AddText_Record(text: text);
    handleOp(result, record);
    return result;
  }

  @override
  void addPlaceholder(
    double width,
    double height,
    PlaceholderAlignment alignment, {
    double scale = 1.0,
    double? baselineOffset,
    TextBaseline? baseline,
  }) {
    final result = proxy.addPlaceholder(
      width,
      height,
      alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
    final record = ParagraphBuilder_AddPlaceholder_Record(
      width: width,
      height: height,
      alignment: alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
    handleOp(result, record);
    return result;
  }

  @override
  Paragraph build() {
    final result = proxy.build();
    handleOp(result);
    return result;
  }
}
