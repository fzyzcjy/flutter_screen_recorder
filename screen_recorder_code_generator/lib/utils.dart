import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

extension ExtSpec on Spec {
  String get dartCode => accept(DartEmitter()).toString();
}

final dartfmt = DartFormatter(pageWidth: 120);
