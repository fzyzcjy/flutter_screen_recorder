import 'dart:typed_data';

class BytesReader {
  final Uint8List bytes;
  var index = 0;

  BytesReader(this.bytes);

  int readByte() => bytes[index++];
}
