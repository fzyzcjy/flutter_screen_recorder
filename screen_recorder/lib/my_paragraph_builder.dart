import 'dart:convert';
import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/dynamic_uint8_list.dart';

class MyParagraphBuilder implements ParagraphBuilder {
  final ParagraphBuilder builder;

  MyParagraphBuilder(ParagraphStyle style) : builder = ParagraphBuilder(style) {
    DataPerFrame.instance.incrCount('ParagraphBuilder.new');

    DataPerFrame.instance.bytes.addParagraphStyle(style);
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
    DataPerFrame.instance.incrCount('addPlaceholder');

    DataPerFrame.instance.bytes.addDouble(width);
    DataPerFrame.instance.bytes.addDouble(height);
    DataPerFrame.instance.bytes.addUint8(alignment.index);
    DataPerFrame.instance.bytes.addDouble(scale);
    if (baselineOffset != null) DataPerFrame.instance.bytes.addDouble(baselineOffset);
    if (baseline != null) DataPerFrame.instance.bytes.addUint8(baseline.index);

    builder.addPlaceholder(
      width,
      height,
      alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
  }

  @override
  void addText(String text) {
    DataPerFrame.instance.incrCount('addText');

    DataPerFrame.instance.bytes.addAll(utf8.encode(text));

    builder.addText(text);
  }

  @override
  void pop() {
    DataPerFrame.instance.incrCount('pop');

    builder.pop();
  }

  @override
  void pushStyle(TextStyle style) {
    DataPerFrame.instance.incrCount('pushStyle');

    DataPerFrame.instance.bytes.addTextStyle(style);

    builder.pushStyle(style);
  }

  @override
  Paragraph build() => builder.build();

  @override
  int get placeholderCount => builder.placeholderCount;

  @override
  List<double> get placeholderScales => builder.placeholderScales;
}

extension on DynamicUint8List {
  void addParagraphStyle(ParagraphStyle style) {
    TODO;
  }

  void addTextStyle(TextStyle style) {
    TODO;
  }
}
