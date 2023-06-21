import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/my_canvas.dart';

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

    DataPerFrame.instance.bytes.addString(text);

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

extension on BytesBuilder {
  void addParagraphStyle(ParagraphStyle style) {
    add(style.encoded.buffer.asUint8List()); // Int32List
    if (style.fontFamily != null) addString(style.fontFamily!); // String?
    if (style.fontSize != null) addDouble(style.fontSize!); // double?
    if (style.height != null) addDouble(style.height!); // double?
    if (style.strutStyle != null) addStrutStyle(style.strutStyle!); // StrutStyle?
    if (style.ellipsis != null) addString(style.ellipsis!); // String?
    // if (style.locale != null) add(style.locale!); // Locale? // TODO
    addUint8(style.leadingDistribution.index); // TextLeadingDistribution
  }

  void addTextStyle(TextStyle style) {
    add(style.encoded.buffer.asUint8List()); // Int32List
    addString(style.fontFamily); // String
    // if (style.fontFamilyFallback != null) add(style.fontFamilyFallback!); // List<String>? // TODO
    if (style.fontSize != null) addDouble(style.fontSize!); // double?
    if (style.letterSpacing != null) addDouble(style.letterSpacing!); // double?
    if (style.wordSpacing != null) addDouble(style.wordSpacing!); // double?
    if (style.height != null) addDouble(style.height!); // double?
    if (style.decorationThickness != null) addDouble(style.decorationThickness!); // double?
    // if (style.locale != null) add(style.locale!); // Locale? // TODO
    if (style.background != null) addPaint(style.background!); // Paint?
    if (style.foreground != null) addPaint(style.foreground!); // Paint?
    // TODO
    // if (style.shadows != null) add(style.shadows!); // List<Shadow>?
    // if (style.fontFeatures != null) add(style.fontFeatures!); // List<FontFeature>?
    // if (style.fontVariations != null) add(style.fontVariations!); // List<FontVariation>?
    if (style.leadingDistribution != null) addUint8(style.leadingDistribution!.index); // TextLeadingDistribution?
  }

  void addStrutStyle(StrutStyle style) {
    add(style.encoded.buffer.asUint8List()); // Int32List
    if (style.fontFamily != null) addString(style.fontFamily!); // String?
    // if (style.fontFamilyFallback != null) add(style.fontFamilyFallback!); // List<String>? // TODO
    if (style.leadingDistribution != null) addUint8(style.leadingDistribution!.index); // TextLeadingDistribution?
  }
}
