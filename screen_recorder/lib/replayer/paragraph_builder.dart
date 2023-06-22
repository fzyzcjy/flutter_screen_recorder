import 'dart:ui';

import 'package:screen_recorder/delegate_base/paragraph_builder.dart';

class ParagraphBuilderReplayer {
  static Paragraph replay(ParagraphBuilderRecordList recordList) {
    final builder = ParagraphBuilder(recordList.constructorRecord!.style);
    for (final record in recordList.methodCallRecords) {
      record.execute(builder);
    }
    return builder.build();
  }
}
