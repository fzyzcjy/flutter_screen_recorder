import 'dart:typed_data';

class DataPerFrame {
  static var instance = DataPerFrame();

  final countMap = <String, int>{};
  final bytes = BytesBuilder(copy: true);

  void incrCount(String name) => countMap[name] = (countMap[name] ?? 0) + 1;

  int get totalCount => countMap.values.fold(0, (a, b) => a + b);

  @override
  String toString() => 'DataPerFrame(countMap: $countMap, totalCount: $totalCount, bytes.length=${bytes.length})';
}
