import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/referable.dart';

class ToBytesContext {
  final ReferableWriteContext referableContextParagraphBuilderRecordList;
  final ReferableWriteContext referableContextCanvasRecordList;
}

class FromBytesContext {
  final ReferableReadContext referableContextParagraphBuilderRecordList;
  final ReferableReadContext referableContextCanvasRecordList;
}

class ContextBytesWriter extends BytesWriter {
  final ToBytesContext context;

  ContextBytesWriter({required this.context});
}

class ContextBytesReader extends BytesReader {
  final FromBytesContext context;

  ContextBytesReader(super.bytes, {required this.context});
}
