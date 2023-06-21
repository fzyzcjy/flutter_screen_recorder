import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

// TODO improve speed
class DynamicUint8List {
  Uint8List _buf;
  int _len;

  DynamicUint8List(int initialCapacity)
      : _buf = Uint8List(initialCapacity),
        _len = 0;

  int get len => _len;

  int get capacity => _buf.length;

  Uint8List dataView() => Uint8List.sublistView(_buf, 0, len);

  void addAll(List<int> values) {
    if (_len + values.length > _buf.length) {
      _increaseCapacity(max(_buf.length * 2, _len + values.length));
    }
    _buf.setRange(_len, _len + values.length, values);
    _len += values.length;
  }

  void addUint8(int value) {
    addAll([value]);
  }

  void addBool(bool value) {
    addUint8(value ? 1 : 0);
  }

  void addUint32(int value) {
    addAll((Uint32List(1)..[0] = value).buffer.asUint8List());
  }

  void addDouble(double value) {
    addAll((Float64List(1)..[0] = value).buffer.asUint8List());
  }

  void addString(String s) {
    addAll(utf8.encode(s));
  }

  void _increaseCapacity(int newSize) {
    final newBuf = Uint8List(newSize);
    newBuf.setRange(0, _len, _buf);
    _buf = newBuf;
  }

  @override
  String toString() => 'DynamicUint8List{len: $_len, items: [${_buf.sublist(0, _len)}]}';
}
