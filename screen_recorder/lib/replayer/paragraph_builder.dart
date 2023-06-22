import 'dart:ui';

import 'package:screen_recorder/delegate_base/paragraph.dart';
import 'package:screen_recorder/delegate_base/paragraph_builder.dart';
import 'package:screen_recorder/record_list.dart';

class ParagraphBuilderReplayer {
  static Paragraph replay(ParagraphBuilderRecordList paragraphBuilderRecordList, ParagraphRecord paragraphRecord) {
    final executeContext = ParagraphBuilder_RecordExecuteContext();

    final builder = ParagraphBuilder(paragraphBuilderRecordList.constructorRecord.style);
    for (final record in paragraphBuilderRecordList.methodCallRecords) {
      record.execute(builder, executeContext);
    }

    final paragraph = builder.build();

    if (paragraphRecord.layoutConstraints != null) {
      paragraph.layout(paragraphRecord.layoutConstraints!);
    }

    return paragraph;
  }
}
