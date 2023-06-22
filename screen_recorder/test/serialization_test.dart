import 'package:flutter_test/flutter_test.dart';
import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/serialization.dart';

void main() {
  group('toBytes and fromBytes', () {
    group('int', () {
      for (final value in [0, 42, -42, 9223372036854775807, -9223372036854775808]) {
        test('value=$value', () {
          _body(
            toBytes: toBytesInt,
            fromBytes: fromBytesInt,
            value: 42,
          );
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

  final reader = BytesReader(bytes);
  final recoveredValue = fromBytes(reader);
  expect(recoveredValue, value);
}
