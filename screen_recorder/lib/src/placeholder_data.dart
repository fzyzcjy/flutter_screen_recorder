import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class PlaceholderData {
  static final instance = PlaceholderData._();

  PlaceholderData._();

  late final ui.Image placeholderImage;

  Future<void> setup() async {
    placeholderImage = await _createPlaceholderImage(100, 100);
  }
}

// ref: Flutter :: createTestImage
Future<ui.Image> _createPlaceholderImage(int width, int height) async {
  final Completer<ui.Image> completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(Uint8List.fromList(List<int>.filled(width * height * 4, 100)), width, height,
      ui.PixelFormat.rgba8888, completer.complete);
  return completer.future;
}
