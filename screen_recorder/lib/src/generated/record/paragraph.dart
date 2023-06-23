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
import 'package:screen_recorder/src/delegate_base/paragraph.dart';

sealed class Paragraph_RecordBase<Ret> {
  Paragraph_RecordBase();

  static Paragraph_RecordBase fromBytes(ContextBytesReader reader) {
    final tag = fromBytesUint8(reader);
    switch (tag) {
      default:
        throw UnimplementedError('unknown tag=$tag');
    }
  }

  Ret execute(Paragraph proxy, Paragraph_RecordExecuteContext executeContext);

  // TODO only a temporary workaround, should remove after implementing serialization
  Paragraph_RecordBase<Ret> temporaryClone();

  void toBytes(ContextBytesWriter writer) {
    toBytesUint8(writer, tag);
    toBytesWithoutTag(writer);
  }

  int get tag;

  void toBytesWithoutTag(ContextBytesWriter writer);
}
