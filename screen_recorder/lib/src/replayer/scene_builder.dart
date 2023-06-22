import 'dart:ui';

import 'package:screen_recorder/src/delegate_base/scene_builder.dart';
import 'package:screen_recorder/src/record_list.dart';

class SceneBuilderReplayer {
  static void replay(
    SceneBuilderRecordList recordList,
    SceneBuilder builder, {
    required Map<int, EngineLayer> mutableEngineLayerIdMap,
  }) {
    final executeContext = SceneBuilder_RecordExecuteContext(mutableEngineLayerIdMap: mutableEngineLayerIdMap);

    for (final record in recordList.methodCallRecords) {
      record.execute(builder, executeContext);
    }

    // return executeContext.nextEngineLayerIdMap;
  }
}
