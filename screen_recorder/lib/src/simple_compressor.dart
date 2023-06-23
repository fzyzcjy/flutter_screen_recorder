import 'dart:io';

class SimpleCompressor {
  final _pendingChunks = <List<int>>[];
  var _pendingChunksBytesLen = 0;

  var _compressedBytesLen = 0;

  void add(List<int> chunk) {
    _pendingChunks.add(chunk);
    _pendingChunksBytesLen += chunk.length;

    if (_pendingChunksBytesLen >= 200000) {
      // ignore: deprecated_export_use
      final pendingData = BytesBuilder(copy: false);
      for (final chunk in _pendingChunks) {
        pendingData.add(chunk);
      }

      _pendingChunks.clear();
      _pendingChunksBytesLen = 0;

      final compressedData = ZLibEncoder().convert(pendingData.takeBytes());
      _compressedBytesLen += compressedData.length;
    }
  }

  @override
  String toString() => 'SimpleCompressor{'
      'pendingChunksBytesLen: $_pendingChunksBytesLen, '
      'compressedBytesLen: $_compressedBytesLen'
      '}';
}
