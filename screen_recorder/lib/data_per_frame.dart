import 'package:screen_recorder/delegate_base/scene_builder.dart';

class DataPerFrame {
  static var instance = DataPerFrame();

  // final experimentalData = ExperimentalData();

  // TODO will be better to use epxando to bind to Scene, and then extract it in window.render()
  final sceneBuilderData = SceneBuilderRecordList();
}

// class ExperimentalData {
//   final countMap = <String, int>{};
//   final bytes = BytesBuilder(copy: true);
//
//   void incrCount(String name) => countMap[name] = (countMap[name] ?? 0) + 1;
//
//   int get totalCount => countMap.values.fold(0, (a, b) => a + b);
//
//   @override
//   String toString() => 'ExperimentalData(countMap: $countMap, totalCount: $totalCount, bytes.length=${bytes.length})';
// }
