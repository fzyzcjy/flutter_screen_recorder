import 'dart:ui';

import 'package:screen_recorder/delegate_base/scene_builder.dart';
import 'package:screen_recorder/record_list.dart';

class SceneBuilderReplayer {
  static void replay(SceneBuilderRecordList recordList, SceneBuilder builder) {
    final executeContext = SceneBuilder_RecordExecuteContext();

    for (final record in recordList.methodCallRecords) {
      record.execute(builder, executeContext);
    }
  }
}
