// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/serialization_utils.dart';
import 'package:screen_recorder/temporary_clone.dart';

abstract class ParagraphBuilder_RecordBase<Ret> {
  Ret execute(ParagraphBuilder proxy);

  // TODO only a temporary workaround, should remove after implementing serialization
  ParagraphBuilder_RecordBase<Ret> temporaryClone();
}

class ParagraphBuilder_PushStyle_Record implements ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_PushStyle_Record({required this.style});

  factory ParagraphBuilder_PushStyle_Record.fromBytes(BytesReader reader) => fromBytesPushStyle(reader);

  final TextStyle style;

  @override
  void execute(ParagraphBuilder proxy) {
    return proxy.pushStyle(style);
  }

  void toBytes(BytesBuilder writer) => toBytesPushStyle(writer);
  @override
  ParagraphBuilder_PushStyle_Record temporaryClone() {
    return ParagraphBuilder_PushStyle_Record(style: style);
  }
}

class ParagraphBuilder_Pop_Record implements ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_Pop_Record();

  factory ParagraphBuilder_Pop_Record.fromBytes(BytesReader reader) => fromBytesPop(reader);

  @override
  void execute(ParagraphBuilder proxy) {
    return proxy.pop();
  }

  void toBytes(BytesBuilder writer) => toBytesPop(writer);
  @override
  ParagraphBuilder_Pop_Record temporaryClone() {
    return ParagraphBuilder_Pop_Record();
  }
}

class ParagraphBuilder_AddText_Record implements ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_AddText_Record({required this.text});

  factory ParagraphBuilder_AddText_Record.fromBytes(BytesReader reader) => fromBytesAddText(reader);

  final String text;

  @override
  void execute(ParagraphBuilder proxy) {
    return proxy.addText(text);
  }

  void toBytes(BytesBuilder writer) => toBytesAddText(writer);
  @override
  ParagraphBuilder_AddText_Record temporaryClone() {
    return ParagraphBuilder_AddText_Record(text: text);
  }
}

class ParagraphBuilder_AddPlaceholder_Record implements ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_AddPlaceholder_Record({
    required this.width,
    required this.height,
    required this.alignment,
    required this.scale,
    required this.baselineOffset,
    required this.baseline,
  });

  factory ParagraphBuilder_AddPlaceholder_Record.fromBytes(BytesReader reader) => fromBytesAddPlaceholder(reader);

  final double width;

  final double height;

  final PlaceholderAlignment alignment;

  final double scale;

  final double? baselineOffset;

  final TextBaseline? baseline;

  @override
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

  void toBytes(BytesBuilder writer) => toBytesAddPlaceholder(writer);
  @override
  ParagraphBuilder_AddPlaceholder_Record temporaryClone() {
    return ParagraphBuilder_AddPlaceholder_Record(
      width: width,
      height: height,
      alignment: alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
  }
}
