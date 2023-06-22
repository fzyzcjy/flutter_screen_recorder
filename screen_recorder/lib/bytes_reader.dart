import 'dart:typed_data';

// also ref https://github.com/brendan-duncan/archive/blob/main/lib/src/util/input_stream.dart
class BytesReader {
  final Uint8List bytes;
  var index = 0;

  BytesReader(this.bytes);

  int readByte() => bytes[index++];

  Uint8List readBytes(int num) {
    final oldIndex = index;
    index += num;
    return bytes.buffer.asUint8List(oldIndex, num);
  }
}
