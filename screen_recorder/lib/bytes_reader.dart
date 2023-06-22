import 'dart:typed_data';

// also ref https://github.com/brendan-duncan/archive/blob/main/lib/src/util/input_stream.dart
class BytesReader {
  final Uint8List bytes;
  var index = 0;

  // ref: protobuf
  // https://github.com/fzyzcjy/yplusplus/issues/9598#issuecomment-1602114654
  final ByteData byteData;

  BytesReader(this.bytes) : byteData = ByteData.view(bytes.buffer);

  int readByte() => bytes[index++];

  Uint8List readBytes(int num) {
    final oldIndex = index;
    advance(num);
    return bytes.buffer.asUint8List(oldIndex, num);
  }

  void advance(int num) {
    index += num;
  }
}
