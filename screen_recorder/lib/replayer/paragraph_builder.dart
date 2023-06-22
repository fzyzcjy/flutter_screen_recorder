import 'dart:ui';

import 'package:screen_recorder/delegate_base/paragraph.dart';
import 'package:screen_recorder/record_list.dart';

class ParagraphBuilderReplayer {
  static Paragraph replay(ParagraphBuilderRecordList paragraphBuilderRecordList, ParagraphRecord paragraphRecord) {
    final builder = ParagraphBuilder(paragraphBuilderRecordList.constructorRecord.style);
    for (final record in paragraphBuilderRecordList.methodCallRecords) {
      record.execute(builder);
    }

    final paragraph = builder.build();

    if (paragraphRecord.constraints != null) {
      paragraph.layout(paragraphRecord.constraints!);
    }

    return paragraph;
  }
}
