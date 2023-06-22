import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/generated/serialization/serialization.dart';
import 'package:screen_recorder/serialization.dart';

void main() {
  group('toBytes and fromBytes', () {
    _addTestGroup(
      'Uint8',
      toBytes: toBytesUint8,
      fromBytes: fromBytesUint8,
      values: [0, 127, 255],
    );

    _addTestGroup(
      'Bool',
      toBytes: toBytesBool,
      fromBytes: fromBytesBool,
      values: [false, true],
    );

    _addTestGroup(
      'Int',
      toBytes: toBytesInt,
      fromBytes: fromBytesInt,
      values: [0, 42, -42, 9223372036854775807, -9223372036854775808],
    );

    _addTestGroup(
      'Float',
      toBytes: toBytesFloat,
      fromBytes: fromBytesFloat,
      values: [0.0, 42.0, -42.0, 3.4028230607370965e+38],
    );

    _addTestGroup(
      'Double',
      toBytes: toBytesDouble,
      fromBytes: fromBytesDouble,
      values: [0.0, 42.0, -42.0, double.maxFinite, -double.maxFinite, double.minPositive],
    );

    _addTestGroup(
      'Uint8List',
      toBytes: toBytesUint8List,
      fromBytes: fromBytesUint8List,
      values: [
        Uint8List(0),
        Uint8List.fromList([0, 128, 255]),
      ],
    );

    _addTestGroup(
      'Int32List',
      toBytes: toBytesInt32List,
      fromBytes: fromBytesInt32List,
      values: [
        Int32List(0),
        Int32List.fromList([0, 42, -42, 2147483647, -2147483648]),
      ],
    );

    _addTestGroup(
      'Float32List',
      toBytes: toBytesFloat32List,
      fromBytes: fromBytesFloat32List,
      values: [
        Float32List(0),
        Float32List.fromList([0.0, 42.0, -42.0, 3.4028230607370965e+38]),
      ],
    );

    _addTestGroup(
      'Float64List',
      toBytes: toBytesFloat64List,
      fromBytes: fromBytesFloat64List,
      values: [
        Float64List(0),
        Float64List.fromList([0.0, 42.0, -42.0, double.maxFinite, -double.maxFinite, double.minPositive]),
      ],
    );

    _addTestGroup(
      'ByteData',
      toBytes: toBytesByteData,
      fromBytes: fromBytesByteData,
      values: [
        ByteData(0),
        ByteData(8)..setInt64(0, 123456789012345),
      ],
      comparisonExtractor: (x) => x.buffer.asUint8List(),
    );

    _addTestGroup(
      'String',
      toBytes: toBytesString,
      fromBytes: fromBytesString,
      values: ['', 'Hello, world!'],
    );

    _addTestGroup(
      'Bytes',
      toBytes: toBytesBytes,
      fromBytes: fromBytesBytes,
      values: [
        <int>[],
        [0, 127, 255]
      ],
    );

    _addTestGroup(
      'Offset',
      toBytes: toBytesOffset,
      fromBytes: fromBytesOffset,
      values: [
        Offset.zero,
        Offset(1234.5, -1234.5),
      ],
    );

    // _addTestGroup(
    //   'X',
    //   toBytes: toBytesX,
    //   fromBytes: fromBytesX,
    //   values: [],
    // );
  });
}

void _addTestGroup<T extends Object>(
  String name, {
  required void Function(BytesWriter writer, T value) toBytes,
  required T Function(BytesReader reader) fromBytes,
  required List<T> values,
  Object Function(T)? comparisonExtractor,
}) {
  assert(values.isNotEmpty);
  group(name, () {
    for (final value in values) {
      test('value=$value', () {
        _body<T>(
          toBytes: toBytes,
          fromBytes: fromBytes,
          value: value,
          comparisonExtractor: comparisonExtractor,
        );
      });
    }
  });
}

void _body<T extends Object>({
  required void Function(BytesWriter writer, T value) toBytes,
  required T Function(BytesReader reader) fromBytes,
  required T value,
  Object Function(T)? comparisonExtractor,
}) {
  comparisonExtractor ??= (x) => x;

  final writer = BytesWriter();
  toBytes(writer, value);
  final bytes = writer.takeBytes();
  debugPrint('bytes=$bytes');

  final reader = BytesReader(bytes);
  final recoveredValue = fromBytes(reader);
  expect(reader.eof, true);

  expect(comparisonExtractor(recoveredValue), comparisonExtractor(value));
}
