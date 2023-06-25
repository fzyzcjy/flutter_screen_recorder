///
//  Generated code. Do not modify.
//  source: fast_screen_recorder.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use interactionPackDescriptor instead')
const InteractionPack$json = const {
  '1': 'InteractionPack',
  '2': const [
    const {'1': 'pointer_events', '3': 1, '4': 3, '5': 11, '6': '.PointerEvent', '10': 'pointerEvents'},
  ],
};

/// Descriptor for `InteractionPack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List interactionPackDescriptor = $convert.base64Decode('Cg9JbnRlcmFjdGlvblBhY2sSNAoOcG9pbnRlcl9ldmVudHMYASADKAsyDS5Qb2ludGVyRXZlbnRSDXBvaW50ZXJFdmVudHM=');
@$core.Deprecated('Use pointerEventDescriptor instead')
const PointerEvent$json = const {
  '1': 'PointerEvent',
  '2': const [
    const {'1': 'timestamp_micros', '3': 1, '4': 1, '5': 3, '10': 'timestampMicros'},
    const {'1': 'dx', '3': 2, '4': 1, '5': 2, '10': 'dx'},
    const {'1': 'dy', '3': 3, '4': 1, '5': 2, '10': 'dy'},
  ],
};

/// Descriptor for `PointerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointerEventDescriptor = $convert.base64Decode('CgxQb2ludGVyRXZlbnQSKQoQdGltZXN0YW1wX21pY3JvcxgBIAEoA1IPdGltZXN0YW1wTWljcm9zEg4KAmR4GAIgASgCUgJkeBIOCgJkeRgDIAEoAlICZHk=');
