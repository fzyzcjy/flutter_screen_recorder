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

  bool get eof => index == bytes.length;
}

// ref Dart [BytesWriter]
class BytesWriter {
  /// Initial size of internal buffer.
  static const int _initSize = 1024;

  /// Reusable empty [Uint8List].
  ///
  /// Safe for reuse because a fixed-length empty list is immutable.
  static final _emptyList = Uint8List(0);

  /// Current count of bytes written to buffer.
  int _length = 0;

  /// Internal buffer accumulating bytes.
  ///
  /// Will grow as necessary
  Uint8List _buffer;

  BytesWriter() : _buffer = _emptyList;

  void add(List<int> bytes) {
    int byteCount = bytes.length;
    if (byteCount == 0) return;
    int required = _length + byteCount;
    if (_buffer.length < required) {
      _grow(required);
    }
    assert(_buffer.length >= required);
    if (bytes is Uint8List) {
      _buffer.setRange(_length, required, bytes);
    } else {
      for (int i = 0; i < byteCount; i++) {
        _buffer[_length + i] = bytes[i];
      }
    }
    _length = required;
  }

  void addByte(int byte) {
    if (_buffer.length == _length) {
      // The grow algorithm always at least doubles.
      // If we added one to _length it would quadruple unnecessarily.
      _grow(_length);
    }
    assert(_buffer.length > _length);
    _buffer[_length] = byte;
    _length++;
  }

  void _grow(int required) {
    // We will create a list in the range of 2-4 times larger than
    // required.
    int newSize = required * 2;
    if (newSize < _initSize) {
      newSize = _initSize;
    } else {
      newSize = _pow2roundup(newSize);
    }
    var newBuffer = Uint8List(newSize);
    newBuffer.setRange(0, _buffer.length, _buffer);
    _buffer = newBuffer;
  }

  Uint8List takeBytes() {
    if (_length == 0) return _emptyList;
    var buffer = Uint8List.view(_buffer.buffer, _buffer.offsetInBytes, _length);
    _clear();
    return buffer;
  }

  Uint8List toBytes() {
    if (_length == 0) return _emptyList;
    return Uint8List.fromList(Uint8List.view(_buffer.buffer, _buffer.offsetInBytes, _length));
  }

  int get length => _length;

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  void clear() {
    _clear();
  }

  void _clear() {
    _length = 0;
    _buffer = _emptyList;
  }

  /// Rounds numbers <= 2^32 up to the nearest power of 2.
  static int _pow2roundup(int x) {
    assert(x > 0);
    --x;
    x |= x >> 1;
    x |= x >> 2;
    x |= x >> 4;
    x |= x >> 8;
    x |= x >> 16;
    return x + 1;
  }
}
