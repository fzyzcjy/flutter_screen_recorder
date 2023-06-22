// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

class ParagraphBuilder_PlaceholderCount_Record {
  ParagraphBuilder_PlaceholderCount_Record();
}

class ParagraphBuilder_PlaceholderScales_Record {
  ParagraphBuilder_PlaceholderScales_Record();
}

class ParagraphBuilder_PushStyle_Record {
  ParagraphBuilder_PushStyle_Record({required this.style});

  final TextStyle style;
}

class ParagraphBuilder_Pop_Record {
  ParagraphBuilder_Pop_Record();
}

class ParagraphBuilder_AddText_Record {
  ParagraphBuilder_AddText_Record({required this.text});

  final String text;
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
}

class ParagraphBuilder_Build_Record {
  ParagraphBuilder_Build_Record();
}
