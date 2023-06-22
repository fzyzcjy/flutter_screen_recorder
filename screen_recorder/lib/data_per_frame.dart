import 'dart:typed_data';

import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/records.dart';

class DataPerFrame {
  static var instance = DataPerFrame();

  final experimentalData = ExperimentalData();
  final sceneBuilderData = RecordList<SceneBuilder_RecordBase>();
}

class ExperimentalData {
  final countMap = <String, int>{};
  final bytes = BytesBuilder(copy: true);

  void incrCount(String name) => countMap[name] = (countMap[name] ?? 0) + 1;

  int get totalCount => countMap.values.fold(0, (a, b) => a + b);

  @override
  String toString() => 'ExperimentalData(countMap: $countMap, totalCount: $totalCount, bytes.length=${bytes.length})';
}
