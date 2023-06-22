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
];
