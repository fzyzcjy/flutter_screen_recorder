import 'dart:ui';

import 'package:screen_recorder/delegate_base/canvas.dart';
import 'package:screen_recorder/record_list.dart';

class CanvasReplayer {
  static Picture replay(CanvasRecordList recordList) {
    final executeContext = Canvas_RecordExecuteContext();

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    for (final record in recordList.methodCallRecords) {
      record.execute(canvas, executeContext);
    }
    return recorder.endRecording();
  }
}
