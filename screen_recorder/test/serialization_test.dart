import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/serialization.dart';

void main() {
  group('toBytes and fromBytes', () {
    group('int', () {
      for (final value in [0, 42, -42, 9223372036854775807, -9223372036854775808]) {
        test('value=$value', () {
          _body(toBytes: toBytesInt, fromBytes: fromBytesInt, value: value);
        });
      }
    });

    group('float32', () {
      for (final value in [0.0, 42.0, -42.0, 3.4028230607370965e+38]) {
        test('value=$value', () {
          _body(toBytes: toBytesFloat, fromBytes: fromBytesFloat, value: value);
        });
      }
    });

    group('float64', () {
      for (final value in [0.0, 42.0, -42.0, double.maxFinite, -double.maxFinite, double.minPositive]) {
        test('value=$value', () {
          _body(toBytes: toBytesDouble, fromBytes: fromBytesDouble, value: value);
        });
      }
    });

    group('bytes', () {
      for (final value in [
        <int>[],
        [0, 127, 255]
      ]) {
        test('value=$value', () {
          _body(toBytes: toBytesBytes, fromBytes: fromBytesBytes, value: value);
        });
      }
    });
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
