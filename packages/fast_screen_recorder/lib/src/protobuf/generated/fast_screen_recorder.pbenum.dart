///
//  Generated code. Do not modify.
//  source: fast_screen_recorder.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PointerEventType extends $pb.ProtobufEnum {
  static const PointerEventType UNKNOWN = PointerEventType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const PointerEventType DOWN = PointerEventType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOWN');
  static const PointerEventType MOVE = PointerEventType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MOVE');
  static const PointerEventType UP = PointerEventType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UP');
  static const PointerEventType HOVER = PointerEventType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HOVER');
  static const PointerEventType CANCEL = PointerEventType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCEL');
  static const PointerEventType PAN_ZOOM_START = PointerEventType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAN_ZOOM_START');
  static const PointerEventType PAN_ZOOM_UPDATE = PointerEventType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAN_ZOOM_UPDATE');
  static const PointerEventType PAN_ZOOM_END = PointerEventType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAN_ZOOM_END');
  static const PointerEventType SIGNAL = PointerEventType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SIGNAL');

  static const $core.List<PointerEventType> values = <PointerEventType> [
    UNKNOWN,
    DOWN,
    MOVE,
    UP,
    HOVER,
    CANCEL,
    PAN_ZOOM_START,
    PAN_ZOOM_UPDATE,
    PAN_ZOOM_END,
    SIGNAL,
  ];

  static final $core.Map<$core.int, PointerEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PointerEventType? valueOf($core.int value) => _byValue[value];

  const PointerEventType._($core.int v, $core.String n) : super(v, n);
}

