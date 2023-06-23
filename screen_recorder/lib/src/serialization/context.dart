import 'package:screen_recorder/src/bytes_reader_writer.dart';

class ToBytesContext {}

class FromBytesContext {}

class ContextBytesWriter extends BytesWriter {
  final ToBytesContext context;

  ContextBytesWriter({required this.context});
}

class ContextBytesReader extends BytesReader {
  final FromBytesContext context;

  ContextBytesReader(super.bytes, {required this.context});
}
