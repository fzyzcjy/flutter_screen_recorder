import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class PlaceholderData {
  static final instance = PlaceholderData._();

  PlaceholderData._();

  late final ui.Image placeholderImage;

  Future<void> setup() async {
    placeholderImage = await _createPlaceholderImage(2000, 2000);
  }
}

// ref: Flutter :: createTestImage
Future<ui.Image> _createPlaceholderImage(int width, int height) async {
  final bytes = Uint8List(width * height * 4);
  for (var i = 0; i < width * height; ++i) {
    bytes[i * 4 + 0] = 0x21;
    bytes[i * 4 + 1] = 0x96;
    bytes[i * 4 + 2] = 0xf3;
    bytes[i * 4 + 3] = 0xff;
  }

  final Completer<ui.Image> completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(Uint8List.fromList(bytes), width, height, ui.PixelFormat.rgba8888, completer.complete);
  return completer.future;
}
