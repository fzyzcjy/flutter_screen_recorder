import 'package:fast_screen_recorder/src/utils/logger.dart';

Future<T?> withCaptureException<T>(Future<T> Function() core) async {
  try {
    return await core();
  } catch (e, s) {
    FastScreenRecorderLogger.error(e, s);
    return null;
  }
}
