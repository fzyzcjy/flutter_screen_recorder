import 'package:flutter/foundation.dart';

abstract class FastScreenRecorderLogger {
  static var log = _defaultLog;
  static var error = _defaultError;

  static void _defaultLog(String tag, String message) => debugPrint('[$tag] $message');

  static void _defaultError(Object error, Object? stackTrace) => debugPrint('ERROR: $error $stackTrace');
}
