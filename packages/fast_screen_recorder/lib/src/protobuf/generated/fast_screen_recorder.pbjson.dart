///
//  Generated code. Do not modify.
//  source: fast_screen_recorder.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use recorderMetadataPackDescriptor instead')
const RecorderMetadataPack$json = const {
  '1': 'RecorderMetadataPack',
  '2': const [
    const {'1': 'interaction', '3': 1, '4': 1, '5': 11, '6': '.InteractionPack', '10': 'interaction'},
    const {'1': 'video', '3': 2, '4': 1, '5': 11, '6': '.VideoMetadataPack', '10': 'video'},
  ],
};

/// Descriptor for `RecorderMetadataPack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recorderMetadataPackDescriptor = $convert.base64Decode('ChRSZWNvcmRlck1ldGFkYXRhUGFjaxIyCgtpbnRlcmFjdGlvbhgBIAEoCzIQLkludGVyYWN0aW9uUGFja1ILaW50ZXJhY3Rpb24SKAoFdmlkZW8YAiABKAsyEi5WaWRlb01ldGFkYXRhUGFja1IFdmlkZW8=');
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
    const {'1': 'flutter_timestamp_micros', '3': 1, '4': 1, '5': 3, '10': 'flutterTimestampMicros'},
    const {'1': 'position_dx', '3': 2, '4': 1, '5': 2, '10': 'positionDx'},
    const {'1': 'position_dy', '3': 3, '4': 1, '5': 2, '10': 'positionDy'},
  ],
};

/// Descriptor for `PointerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointerEventDescriptor = $convert.base64Decode('CgxQb2ludGVyRXZlbnQSOAoYZmx1dHRlcl90aW1lc3RhbXBfbWljcm9zGAEgASgDUhZmbHV0dGVyVGltZXN0YW1wTWljcm9zEh8KC3Bvc2l0aW9uX2R4GAIgASgCUgpwb3NpdGlvbkR4Eh8KC3Bvc2l0aW9uX2R5GAMgASgCUgpwb3NpdGlvbkR5');
@$core.Deprecated('Use videoMetadataPackDescriptor instead')
const VideoMetadataPack$json = const {
  '1': 'VideoMetadataPack',
  '2': const [
    const {'1': 'frame_infos', '3': 1, '4': 3, '5': 11, '6': '.VideoFrameInfo', '10': 'frameInfos'},
  ],
};

/// Descriptor for `VideoMetadataPack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoMetadataPackDescriptor = $convert.base64Decode('ChFWaWRlb01ldGFkYXRhUGFjaxIwCgtmcmFtZV9pbmZvcxgBIAMoCzIPLlZpZGVvRnJhbWVJbmZvUgpmcmFtZUluZm9z');
@$core.Deprecated('Use videoFrameInfoDescriptor instead')
const VideoFrameInfo$json = const {
  '1': 'VideoFrameInfo',
  '2': const [
    const {'1': 'flutter_timestamp_micros', '3': 1, '4': 1, '5': 3, '10': 'flutterTimestampMicros'},
  ],
};

/// Descriptor for `VideoFrameInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoFrameInfoDescriptor = $convert.base64Decode('Cg5WaWRlb0ZyYW1lSW5mbxI4ChhmbHV0dGVyX3RpbWVzdGFtcF9taWNyb3MYASABKANSFmZsdXR0ZXJUaW1lc3RhbXBNaWNyb3M=');
