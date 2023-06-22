import 'dart:io';

class SimpleCompressor {
  final _pendingChunks = <List<int>>[];
  var _compressedBytesLen = 0;

  int get pendingChunksBytesLen => _pendingChunks.fold(0, (a, b) => a + b.length);

  void add(List<int> chunk) {
    _pendingChunks.add(chunk);

    if (pendingChunksBytesLen >= 200000) {
      // ignore: deprecated_export_use
      final pendingData = BytesWriter(copy: false);
      for (final chunk in _pendingChunks) {
        pendingData.add(chunk);
      }
      _pendingChunks.clear();

      final compressedData = ZLibEncoder().convert(pendingData.takeBytes());
      _compressedBytesLen += compressedData.length;
    }
  }

  @override
  String toString() => 'SimpleCompressor{'
      'pendingChunksBytesLen: $pendingChunksBytesLen, '
      'compressedBytesLen: $_compressedBytesLen'
      '}';
}
