import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/serialization.dart';

void main() {
  group('toBytes and fromBytes', () {
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
      'Bytes',
      toBytes: toBytesBytes,
      fromBytes: fromBytesBytes,
      values: [
        <int>[],
        [0, 127, 255]
      ],
    );
  });
}

void _addTestGroup<T extends Object>(
  String name, {
  required void Function(BytesWriter writer, T value) toBytes,
  required T Function(BytesReader reader) fromBytes,
  required List<T> values,
}) {
  group(name, () {
    for (final value in values) {
      test('value=$value', () {
        _body<T>(toBytes: toBytes, fromBytes: fromBytes, value: value);
      });
    }
  });
}

void _body<T extends Object>({
  required void Function(BytesWriter writer, T value) toBytes,
  required T Function(BytesReader reader) fromBytes,
  required T value,
}) {
  final writer = BytesWriter();
  toBytes(writer, value);
  final bytes = writer.takeBytes();
  debugPrint('bytes=$bytes');

  final reader = BytesReader(bytes);
  final recoveredValue = fromBytes(reader);
  expect(reader.eof, true);

  expect(recoveredValue, value);
}
