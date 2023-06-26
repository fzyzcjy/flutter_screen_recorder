import 'package:flutter/foundation.dart';

typedef FastScreenRecorderLogger = void Function(String tag, String message, Object? error, Object? stackTrace);

var fastScreenRecorderLogger = _defaultLogger;

void _defaultLogger(String tag, String message, Object? error, Object? stackTrace) {
  debugPrint('[$tag] $message');
  if (error != null) debugPrint('ERROR: $error $stackTrace');
}
