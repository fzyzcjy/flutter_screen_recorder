import 'package:screen_recorder/dynamic_uint8_list.dart';

class DataPerFrame {
  static var instance = DataPerFrame();

  final countMap = <String, int>{};
  final bytes = DynamicUint8List(4096);

  void incrCount(String name) => countMap[name] = (countMap[name] ?? 0) + 1;

  int get totalCount => countMap.values.fold(0, (a, b) => a + b);

  @override
  String toString() => 'DataPerFrame(countMap: $countMap, totalCount: $totalCount, bytes.length=${bytes.len})';
}
