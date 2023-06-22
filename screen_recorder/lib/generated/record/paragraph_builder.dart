// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

class ParagraphBuilder_PushStyle_Record {
  ParagraphBuilder_PushStyle_Record({required this.style});

  final TextStyle style;

  void execute(ParagraphBuilder proxy) {
    return proxy.pushStyle(style);
  }
}

class ParagraphBuilder_Pop_Record {
  ParagraphBuilder_Pop_Record();

  void execute(ParagraphBuilder proxy) {
    return proxy.pop();
  }
}

class ParagraphBuilder_AddText_Record {
  ParagraphBuilder_AddText_Record({required this.text});

  final String text;

  void execute(ParagraphBuilder proxy) {
    return proxy.addText(text);
  }
}

class ParagraphBuilder_AddPlaceholder_Record {
  ParagraphBuilder_AddPlaceholder_Record({
    required this.width,
    required this.height,
    required this.alignment,
    required this.scale,
    required this.baselineOffset,
    required this.baseline,
  });

  final double width;

  final double height;

  final PlaceholderAlignment alignment;

  final double scale;

  final double? baselineOffset;

  final TextBaseline? baseline;

  void execute(ParagraphBuilder proxy) {
    return proxy.addPlaceholder(
      width,
      height,
      alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
  }
}
