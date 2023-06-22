import 'dart:ui' as ui;

class PlaceholderData {
  static final instance = PlaceholderData._();

  PlaceholderData._();

  late final ui.Image placeholderImage;

  Future<void> setup() async {
    placeholderImage = TODO;
  }
}
