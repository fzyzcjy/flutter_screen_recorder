import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';

class MyParagraphBuilder implements ParagraphBuilder {
  final ParagraphBuilder builder;

  MyParagraphBuilder(this.builder) {
    DataPerFrame.instance.incrCount('ParagraphBuilder.new');
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

    builder.pushStyle(style);
  }

  @override
  Paragraph build() => builder.build();

  @override
  int get placeholderCount => builder.placeholderCount;

  @override
  List<double> get placeholderScales => builder.placeholderScales;
}
