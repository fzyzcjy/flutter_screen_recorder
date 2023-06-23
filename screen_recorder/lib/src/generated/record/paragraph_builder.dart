// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/generated/serialization/serialization.dart';
import 'package:screen_recorder/src/serialization.dart';
import 'package:screen_recorder/src/temporary_clone.dart';
import 'package:screen_recorder/src/delegate_base/paragraph_builder.dart';

sealed class ParagraphBuilder_RecordBase<Ret> {
  ParagraphBuilder_RecordBase();

  static ParagraphBuilder_RecordBase fromBytes(ContextBytesReader reader) {
    final tag = fromBytesUint8(reader);
    switch (tag) {
      case 0:
        return ParagraphBuilder_PushStyle_Record.fromBytes(reader);
      case 1:
        return ParagraphBuilder_Pop_Record.fromBytes(reader);
      case 2:
        return ParagraphBuilder_AddText_Record.fromBytes(reader);
      case 3:
        return ParagraphBuilder_AddPlaceholder_Record.fromBytes(reader);
      default:
        throw UnimplementedError('unknown tag=$tag');
    }
  }

  Ret execute(ParagraphBuilder proxy, ParagraphBuilder_RecordExecuteContext executeContext);

  // TODO only a temporary workaround, should remove after implementing serialization
  ParagraphBuilder_RecordBase<Ret> temporaryClone();

  void toBytes(ContextBytesWriter writer) {
    toBytesUint8(writer, tag);
    toBytesWithoutTag(writer);
  }

  int get tag;

  void toBytesWithoutTag(ContextBytesWriter writer);
}

class ParagraphBuilder_PushStyle_Record extends ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_PushStyle_Record({required this.style});

  factory ParagraphBuilder_PushStyle_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesParagraphBuilderPushStyleRecord(reader);

  final TextStyle style;

  @override
  void execute(
    ParagraphBuilder proxy,
    ParagraphBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushStyle(style);
    return result;
  }

  @override
  int get tag => 0;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesParagraphBuilderPushStyleRecord(writer, this);
  @override
  ParagraphBuilder_PushStyle_Record temporaryClone() {
    return ParagraphBuilder_PushStyle_Record(style: style);
  }
}

class ParagraphBuilder_Pop_Record extends ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_Pop_Record();

  factory ParagraphBuilder_Pop_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesParagraphBuilderPopRecord(reader);

  @override
  void execute(
    ParagraphBuilder proxy,
    ParagraphBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pop();
    return result;
  }

  @override
  int get tag => 1;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesParagraphBuilderPopRecord(writer, this);
  @override
  ParagraphBuilder_Pop_Record temporaryClone() {
    return ParagraphBuilder_Pop_Record();
  }
}

class ParagraphBuilder_AddText_Record extends ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_AddText_Record({required this.text});

  factory ParagraphBuilder_AddText_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesParagraphBuilderAddTextRecord(reader);

  final String text;

  @override
  void execute(
    ParagraphBuilder proxy,
    ParagraphBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addText(text);
    return result;
  }

  @override
  int get tag => 2;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesParagraphBuilderAddTextRecord(writer, this);
  @override
  ParagraphBuilder_AddText_Record temporaryClone() {
    return ParagraphBuilder_AddText_Record(text: text);
  }
}

class ParagraphBuilder_AddPlaceholder_Record extends ParagraphBuilder_RecordBase<void> {
  ParagraphBuilder_AddPlaceholder_Record({
    required this.width,
    required this.height,
    required this.alignment,
    required this.scale,
    required this.baselineOffset,
    required this.baseline,
  });

  factory ParagraphBuilder_AddPlaceholder_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesParagraphBuilderAddPlaceholderRecord(reader);

  final double width;

  final double height;

  final PlaceholderAlignment alignment;

  final double scale;

  final double? baselineOffset;

  final TextBaseline? baseline;

  @override
  void execute(
    ParagraphBuilder proxy,
    ParagraphBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addPlaceholder(
      width,
      height,
      alignment,
      scale: scale,
      baselineOffset: baselineOffset,
      baseline: baseline,
    );
    return result;
  }

  @override
  int get tag => 3;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesParagraphBuilderAddPlaceholderRecord(writer, this);
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
