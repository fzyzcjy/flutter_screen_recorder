import 'dart:ui';

import 'package:screen_recorder/record_list.dart';

class SceneBuilderReplayer {
  static void replay(SceneBuilderRecordList recordList, SceneBuilder builder) {
    for (final record in recordList.methodCallRecords) {
      record.execute(builder);
    }
  }
}
