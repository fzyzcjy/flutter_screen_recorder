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
    className: 'RSTransform',
    fields: [
      ConfigField(type: 'double', name: 'scos', named: false),
      ConfigField(type: 'double', name: 'ssin', named: false),
      ConfigField(type: 'double', name: 'tx', named: false),
      ConfigField(type: 'double', name: 'ty', named: false),
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
    constructorName: 'raw',
    fields: [
      ConfigField(type: 'ByteData', name: 'encoded', named: true),
      ConfigField(type: 'TextLeadingDistribution?', name: 'leadingDistribution', named: true),
      ConfigField(type: 'String?', name: 'fontFamily', named: true),
      ConfigField(type: 'List<String>?', name: 'fontFamilyFallback', named: true),
    ],
  ),
  Config(
    className: 'TextHeightBehavior',
    fields: [
      ConfigField(type: 'bool', name: 'applyHeightToFirstAscent', named: true),
      ConfigField(type: 'bool', name: 'applyHeightToLastDescent', named: true),
      ConfigField(type: 'TextLeadingDistribution', name: 'leadingDistribution', named: true),
    ],
  ),
  Config(
    className: 'Shadow',
    fields: [
      ConfigField(type: 'Color', name: 'color', named: true),
      ConfigField(type: 'Offset', name: 'offset', named: true),
      ConfigField(type: 'double', name: 'blurRadius', named: true),
    ],
  ),
  Config(
    className: 'FontVariation',
    fields: [
      ConfigField(type: 'String', name: 'axis', named: false),
      ConfigField(type: 'double', name: 'value', named: false),
    ],
  ),
  Config(
    className: 'FontFeature',
    fields: [
      ConfigField(type: 'String', name: 'feature', named: false),
      ConfigField(type: 'int', name: 'value', named: false),
    ],
  ),
  Config(
    className: 'Color',
    fields: [
      ConfigField(type: 'int', name: 'value', named: false),
    ],
  ),
  Config(
    className: 'Locale',
    constructorName: 'fromSubtags',
    fields: [
      ConfigField(type: 'String', name: 'languageCode', named: true),
      ConfigField(type: 'String?', name: 'scriptCode', named: true),
      ConfigField(type: 'String?', name: 'countryCode', named: true),
    ],
  ),
  Config(
    className: 'TextDecoration',
    constructorName: 'raw',
    fields: [
      ConfigField(type: 'int', name: 'mask', named: false),
    ],
  ),
  Config(
    className: 'Paint',
    constructorName: 'raw',
    fields: [
      ConfigField(type: 'ByteData', name: 'data', named: false),
      // TODO handle shaders etc
    ],
  ),
  Config(
    className: 'ParagraphBuilderRecordList',
    enableReferable: true,
    fields: [
      ConfigField(type: 'int', name: 'id', named: true),
      ConfigField(type: 'ParagraphBuilder_Constructor_Record', name: 'constructorRecord', named: true),
      ConfigField(type: 'List<ParagraphBuilder_RecordBase>', name: 'methodCallRecords', named: true),
    ],
  ),
  Config(
    className: 'CanvasRecordList',
    fields: [
      ConfigField(type: 'List<Canvas_RecordBase>', name: 'methodCallRecords', named: true),
    ],
  ),
  Config(
    className: 'SceneBuilderRecordList',
    fields: [
      ConfigField(type: 'List<SceneBuilder_RecordBase>', name: 'methodCallRecords', named: true),
    ],
  ),
  Config(
    className: 'ParagraphBuilder_Constructor_Record',
    fields: [
      ConfigField(type: 'ParagraphStyle', name: 'style', named: true),
    ],
  ),
  Config(
    className: 'ParagraphConstraints',
    fields: [
      ConfigField(type: 'double', name: 'width', named: true),
    ],
  ),
  Config(
    className: 'ParagraphRecord',
    fields: [
      ConfigField(type: 'ParagraphConstraints?', name: 'layoutConstraints', named: true),
    ],
  ),
  Config(
    className: 'TouchPerFrameData',
    fields: [
      ConfigField(type: 'List<Offset>', name: 'positions', named: true),
    ],
  ),
  Config(
    className: 'FramePacket',
    fields: [
      ConfigField(type: 'SceneBuilderRecordList', name: 'scene', named: true),
      ConfigField(type: 'TouchPerFrameData', name: 'touch', named: true),
    ],
  ),
];
