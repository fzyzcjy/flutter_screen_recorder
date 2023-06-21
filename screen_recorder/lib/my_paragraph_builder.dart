import 'dart:ui';

class MyParagraphBuilder implements ParagraphBuilder {
  final ParagraphBuilder builder;

  MyParagraphBuilder(this.builder);

  @override
  void addPlaceholder(
    double width,
    double height,
    PlaceholderAlignment alignment, {
    double scale = 1.0,
    double? baselineOffset,
    TextBaseline? baseline,
  }) {
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
    builder.addText(text);
  }

  @override
  Paragraph build() {
    return builder.build();
  }

  @override
  int get placeholderCount => builder.placeholderCount;

  @override
  List<double> get placeholderScales => builder.placeholderScales;

  @override
  void pop() {
    builder.pop();
  }

  @override
  void pushStyle(TextStyle style) {
    builder.pushStyle(style);
  }
}
