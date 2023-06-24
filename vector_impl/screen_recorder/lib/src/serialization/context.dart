import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/record_list.dart';
import 'package:screen_recorder/src/referable.dart';

class ToBytesContext {
  final referableContextParagraphBuilderRecordList = ReferableWriteContext<ParagraphBuilderRecordList>();
  final referableContextCanvasRecordList = ReferableWriteContext<CanvasRecordList>();
}

class FromBytesContext {
  final referableContextParagraphBuilderRecordList = ReferableReadContext<ParagraphBuilderRecordList>();
  final referableContextCanvasRecordList = ReferableReadContext<CanvasRecordList>();
}

class ContextBytesWriter extends BytesWriter {
  final ToBytesContext context;

  ContextBytesWriter({required this.context});
}

class ContextBytesReader extends BytesReader {
  final FromBytesContext context;

  ContextBytesReader(super.bytes, {required this.context});
}
