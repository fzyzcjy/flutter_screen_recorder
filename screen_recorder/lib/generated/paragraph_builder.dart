// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/manual/paragraph_builder.dart';

class MyParagraphBuilder with MyParagraphBuilderMixin implements ParagraphBuilder {
  final ParagraphBuilder proxy;

  MyParagraphBuilder(this.proxy);

  @override
  int get placeholderCount {
    return proxy.placeholderCount;
  }

  @override
  List<double> get placeholderScales {
    return proxy.placeholderScales;
  }

  @override
  void pushStyle(TextStyle style) {
    return proxy.pushStyle(style);
  }

  @override
  void pop() {
    return proxy.pop();
  }

  @override
  void addText(String text) {
    return proxy.addText(text);
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
    return proxy.addPlaceholder(
      width,
      height,
      alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
  }

  @override
  Paragraph build() {
    return proxy.build();
  }
}
