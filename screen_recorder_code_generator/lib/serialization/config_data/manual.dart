import 'package:screen_recorder_code_generator/serialization/config.dart';

final kManualConfigs = [
  Config(
    className: 'Offset',
    fields: [
      ConfigField(type: 'double', name: 'dx', named: false),
      ConfigField(type: 'double', name: 'dy', named: false),
    ],
  ),
  Config(
    className: 'Rect',
    constructorName: 'fromLTRB',
    fields: [
      ConfigField(type: 'double', name: 'left', named: false),
      ConfigField(type: 'double', name: 'top', named: false),
      ConfigField(type: 'double', name: 'right', named: false),
      ConfigField(type: 'double', name: 'bottom', named: false),
    ],
  ),
  Config(
    className: 'RRect',
    constructorName: 'fromLTRBAndCorners',
    constructorParams: 'left, top, right, bottom, '
        'topLeft: Radius.elliptical(tlRadiusX, tlRadiusY), '
        'topRight: Radius.elliptical(trRadiusX, trRadiusY), '
        'bottomLeft: Radius.elliptical(blRadiusX, blRadiusY), '
        'bottomRight: Radius.elliptical(brRadiusX, brRadiusY), ',
    fields: [
      ConfigField(type: 'double', name: 'left', named: false),
      ConfigField(type: 'double', name: 'top', named: false),
      ConfigField(type: 'double', name: 'right', named: false),
      ConfigField(type: 'double', name: 'bottom', named: false),
      ConfigField(type: 'double', name: 'tlRadiusX', named: false),
      ConfigField(type: 'double', name: 'tlRadiusY', named: false),
      ConfigField(type: 'double', name: 'trRadiusX', named: false),
      ConfigField(type: 'double', name: 'trRadiusY', named: false),
      ConfigField(type: 'double', name: 'brRadiusX', named: false),
      ConfigField(type: 'double', name: 'brRadiusY', named: false),
      ConfigField(type: 'double', name: 'blRadiusX', named: false),
      ConfigField(type: 'double', name: 'blRadiusY', named: false),
    ],
  ),
  Config(
    className: 'ParagraphStyle',
    fields: [
      ConfigField(type: 'TextAlign?', name: 'textAlign', named: true),
      ConfigField(type: 'TextDirection?', name: 'textDirection', named: true),
      ConfigField(type: 'int?', name: 'maxLines', named: true),
      ConfigField(type: 'String?', name: 'fontFamily', named: true),
      ConfigField(type: 'double?', name: 'fontSize', named: true),
      ConfigField(type: 'double?', name: 'height', named: true),
      ConfigField(type: 'TextHeightBehavior?', name: 'textHeightBehavior', named: true),
      ConfigField(type: 'FontWeight?', name: 'fontWeight', named: true),
      ConfigField(type: 'FontStyle?', name: 'fontStyle', named: true),
      ConfigField(type: 'StrutStyle?', name: 'strutStyle', named: true),
      ConfigField(type: 'String?', name: 'ellipsis', named: true),
      ConfigField(type: 'Locale?', name: 'locale', named: true),
    ],
  ),
  Config(
    className: 'TextStyle',
    fields: [
      ConfigField(type: 'Color?', name: 'color', named: true),
      ConfigField(type: 'TextDecoration?', name: 'decoration', named: true),
      ConfigField(type: 'Color?', name: 'decorationColor', named: true),
      ConfigField(type: 'TextDecorationStyle?', name: 'decorationStyle', named: true),
      ConfigField(type: 'double?', name: 'decorationThickness', named: true),
      ConfigField(type: 'FontWeight?', name: 'fontWeight', named: true),
      ConfigField(type: 'FontStyle?', name: 'fontStyle', named: true),
      ConfigField(type: 'TextBaseline?', name: 'textBaseline', named: true),
      ConfigField(type: 'String?', name: 'fontFamily', named: true),
      ConfigField(type: 'List<String>?', name: 'fontFamilyFallback', named: true),
      ConfigField(type: 'double?', name: 'fontSize', named: true),
      ConfigField(type: 'double?', name: 'letterSpacing', named: true),
      ConfigField(type: 'double?', name: 'wordSpacing', named: true),
      ConfigField(type: 'double?', name: 'height', named: true),
      ConfigField(type: 'TextLeadingDistribution?', name: 'leadingDistribution', named: true),
      ConfigField(type: 'Locale?', name: 'locale', named: true),
      ConfigField(type: 'Paint?', name: 'background', named: true),
      ConfigField(type: 'Paint?', name: 'foreground', named: true),
      ConfigField(type: 'List<Shadow>?', name: 'shadows', named: true),
      ConfigField(type: 'List<FontFeature>?', name: 'fontFeatures', named: true),
      ConfigField(type: 'List<FontVariation>?', name: 'fontVariations', named: true),
    ],
  ),
  Config(
    className: 'StrutStyle',
    fields: [
      ConfigField(type: 'ByteData', name: 'encoded', named: true),
      ConfigField(type: 'TextLeadingDistribution?', name: 'leadingDistribution', named: true),
      ConfigField(type: 'String?', name: 'fontFamily', named: true),
      ConfigField(type: 'List<String>?', name: 'fontFamilyFallback', named: true),
    ],
  ),
];
