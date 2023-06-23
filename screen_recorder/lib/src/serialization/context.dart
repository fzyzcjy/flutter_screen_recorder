import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/record_list.dart';
import 'package:screen_recorder/src/referable.dart';

class ToBytesContext {
  final ReferableWriteContext<ParagraphBuilderRecordList> referableContextParagraphBuilderRecordList;
  final ReferableWriteContext<CanvasRecordList> referableContextCanvasRecordList;
}

class FromBytesContext {
  final ReferableReadContext<ParagraphBuilderRecordList> referableContextParagraphBuilderRecordList;
  final ReferableReadContext<CanvasRecordList> referableContextCanvasRecordList;
}

class ContextBytesWriter extends BytesWriter {
  final ToBytesContext context;

  ContextBytesWriter({required this.context});
}

class ContextBytesReader extends BytesReader {
  final FromBytesContext context;

  ContextBytesReader(super.bytes, {required this.context});
}
