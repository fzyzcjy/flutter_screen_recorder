///
//  Generated code. Do not modify.
//  source: fast_screen_recorder.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'fast_screen_recorder.pbenum.dart';

export 'fast_screen_recorder.pbenum.dart';

class RecorderMetadataPack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RecorderMetadataPack', createEmptyInstance: create)
    ..aOM<InteractionPack>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'interaction', subBuilder: InteractionPack.create)
    ..aOM<VideoMetadataPack>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video', subBuilder: VideoMetadataPack.create)
    ..aOM<DeviceMetadata>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: DeviceMetadata.create)
    ..hasRequiredFields = false
  ;

  RecorderMetadataPack._() : super();
  factory RecorderMetadataPack({
    InteractionPack? interaction,
    VideoMetadataPack? video,
    DeviceMetadata? device,
  }) {
    final _result = create();
    if (interaction != null) {
      _result.interaction = interaction;
    }
    if (video != null) {
      _result.video = video;
    }
    if (device != null) {
      _result.device = device;
    }
    return _result;
  }
  factory RecorderMetadataPack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecorderMetadataPack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecorderMetadataPack clone() => RecorderMetadataPack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecorderMetadataPack copyWith(void Function(RecorderMetadataPack) updates) => super.copyWith((message) => updates(message as RecorderMetadataPack)) as RecorderMetadataPack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecorderMetadataPack create() => RecorderMetadataPack._();
  RecorderMetadataPack createEmptyInstance() => create();
  static $pb.PbList<RecorderMetadataPack> createRepeated() => $pb.PbList<RecorderMetadataPack>();
  @$core.pragma('dart2js:noInline')
  static RecorderMetadataPack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecorderMetadataPack>(create);
  static RecorderMetadataPack? _defaultInstance;

  @$pb.TagNumber(1)
  InteractionPack get interaction => $_getN(0);
  @$pb.TagNumber(1)
  set interaction(InteractionPack v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteraction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteraction() => clearField(1);
  @$pb.TagNumber(1)
  InteractionPack ensureInteraction() => $_ensure(0);

  @$pb.TagNumber(2)
  VideoMetadataPack get video => $_getN(1);
  @$pb.TagNumber(2)
  set video(VideoMetadataPack v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideo() => clearField(2);
  @$pb.TagNumber(2)
  VideoMetadataPack ensureVideo() => $_ensure(1);

  @$pb.TagNumber(3)
  DeviceMetadata get device => $_getN(2);
  @$pb.TagNumber(3)
  set device(DeviceMetadata v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDevice() => $_has(2);
  @$pb.TagNumber(3)
  void clearDevice() => clearField(3);
  @$pb.TagNumber(3)
  DeviceMetadata ensureDevice() => $_ensure(2);
}

class InteractionPack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InteractionPack', createEmptyInstance: create)
    ..pc<PointerEvent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pointerEvents', $pb.PbFieldType.PM, subBuilder: PointerEvent.create)
    ..hasRequiredFields = false
  ;

  InteractionPack._() : super();
  factory InteractionPack({
    $core.Iterable<PointerEvent>? pointerEvents,
  }) {
    final _result = create();
    if (pointerEvents != null) {
      _result.pointerEvents.addAll(pointerEvents);
    }
    return _result;
  }
  factory InteractionPack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InteractionPack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InteractionPack clone() => InteractionPack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InteractionPack copyWith(void Function(InteractionPack) updates) => super.copyWith((message) => updates(message as InteractionPack)) as InteractionPack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InteractionPack create() => InteractionPack._();
  InteractionPack createEmptyInstance() => create();
  static $pb.PbList<InteractionPack> createRepeated() => $pb.PbList<InteractionPack>();
  @$core.pragma('dart2js:noInline')
  static InteractionPack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InteractionPack>(create);
  static InteractionPack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PointerEvent> get pointerEvents => $_getList(0);
}

class PointerEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PointerEvent', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flutterTimestampMicros')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positionDx', $pb.PbFieldType.OF)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positionDy', $pb.PbFieldType.OF)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wallclockTimestampMicros')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pointer', $pb.PbFieldType.O3)
    ..e<PointerEventType>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PointerEventType.UNKNOWN, valueOf: PointerEventType.valueOf, enumValues: PointerEventType.values)
    ..hasRequiredFields = false
  ;

  PointerEvent._() : super();
  factory PointerEvent({
    $fixnum.Int64? flutterTimestampMicros,
    $core.double? positionDx,
    $core.double? positionDy,
    $fixnum.Int64? wallclockTimestampMicros,
    $core.int? pointer,
    PointerEventType? type,
  }) {
    final _result = create();
    if (flutterTimestampMicros != null) {
      _result.flutterTimestampMicros = flutterTimestampMicros;
    }
    if (positionDx != null) {
      _result.positionDx = positionDx;
    }
    if (positionDy != null) {
      _result.positionDy = positionDy;
    }
    if (wallclockTimestampMicros != null) {
      _result.wallclockTimestampMicros = wallclockTimestampMicros;
    }
    if (pointer != null) {
      _result.pointer = pointer;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory PointerEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointerEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PointerEvent clone() => PointerEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PointerEvent copyWith(void Function(PointerEvent) updates) => super.copyWith((message) => updates(message as PointerEvent)) as PointerEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointerEvent create() => PointerEvent._();
  PointerEvent createEmptyInstance() => create();
  static $pb.PbList<PointerEvent> createRepeated() => $pb.PbList<PointerEvent>();
  @$core.pragma('dart2js:noInline')
  static PointerEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointerEvent>(create);
  static PointerEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get flutterTimestampMicros => $_getI64(0);
  @$pb.TagNumber(1)
  set flutterTimestampMicros($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFlutterTimestampMicros() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlutterTimestampMicros() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get positionDx => $_getN(1);
  @$pb.TagNumber(2)
  set positionDx($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPositionDx() => $_has(1);
  @$pb.TagNumber(2)
  void clearPositionDx() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get positionDy => $_getN(2);
  @$pb.TagNumber(3)
  set positionDy($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPositionDy() => $_has(2);
  @$pb.TagNumber(3)
  void clearPositionDy() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get wallclockTimestampMicros => $_getI64(3);
  @$pb.TagNumber(4)
  set wallclockTimestampMicros($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWallclockTimestampMicros() => $_has(3);
  @$pb.TagNumber(4)
  void clearWallclockTimestampMicros() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get pointer => $_getIZ(4);
  @$pb.TagNumber(5)
  set pointer($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPointer() => $_has(4);
  @$pb.TagNumber(5)
  void clearPointer() => clearField(5);

  @$pb.TagNumber(6)
  PointerEventType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(PointerEventType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);
}

class VideoMetadataPack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VideoMetadataPack', createEmptyInstance: create)
    ..pc<VideoFrameInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'frameInfos', $pb.PbFieldType.PM, subBuilder: VideoFrameInfo.create)
    ..hasRequiredFields = false
  ;

  VideoMetadataPack._() : super();
  factory VideoMetadataPack({
    $core.Iterable<VideoFrameInfo>? frameInfos,
  }) {
    final _result = create();
    if (frameInfos != null) {
      _result.frameInfos.addAll(frameInfos);
    }
    return _result;
  }
  factory VideoMetadataPack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoMetadataPack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoMetadataPack clone() => VideoMetadataPack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoMetadataPack copyWith(void Function(VideoMetadataPack) updates) => super.copyWith((message) => updates(message as VideoMetadataPack)) as VideoMetadataPack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VideoMetadataPack create() => VideoMetadataPack._();
  VideoMetadataPack createEmptyInstance() => create();
  static $pb.PbList<VideoMetadataPack> createRepeated() => $pb.PbList<VideoMetadataPack>();
  @$core.pragma('dart2js:noInline')
  static VideoMetadataPack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoMetadataPack>(create);
  static VideoMetadataPack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<VideoFrameInfo> get frameInfos => $_getList(0);
}

class VideoFrameInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VideoFrameInfo', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wallclockTimestampMicros')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoTimestampMicros')
    ..hasRequiredFields = false
  ;

  VideoFrameInfo._() : super();
  factory VideoFrameInfo({
    $fixnum.Int64? wallclockTimestampMicros,
    $fixnum.Int64? videoTimestampMicros,
  }) {
    final _result = create();
    if (wallclockTimestampMicros != null) {
      _result.wallclockTimestampMicros = wallclockTimestampMicros;
    }
    if (videoTimestampMicros != null) {
      _result.videoTimestampMicros = videoTimestampMicros;
    }
    return _result;
  }
  factory VideoFrameInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoFrameInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoFrameInfo clone() => VideoFrameInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoFrameInfo copyWith(void Function(VideoFrameInfo) updates) => super.copyWith((message) => updates(message as VideoFrameInfo)) as VideoFrameInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VideoFrameInfo create() => VideoFrameInfo._();
  VideoFrameInfo createEmptyInstance() => create();
  static $pb.PbList<VideoFrameInfo> createRepeated() => $pb.PbList<VideoFrameInfo>();
  @$core.pragma('dart2js:noInline')
  static VideoFrameInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoFrameInfo>(create);
  static VideoFrameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get wallclockTimestampMicros => $_getI64(0);
  @$pb.TagNumber(1)
  set wallclockTimestampMicros($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWallclockTimestampMicros() => $_has(0);
  @$pb.TagNumber(1)
  void clearWallclockTimestampMicros() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get videoTimestampMicros => $_getI64(1);
  @$pb.TagNumber(2)
  set videoTimestampMicros($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoTimestampMicros() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoTimestampMicros() => clearField(2);
}

class DeviceMetadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeviceMetadata', createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalWidth', $pb.PbFieldType.OF)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalHeight', $pb.PbFieldType.OF)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'devicePixelRatio', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  DeviceMetadata._() : super();
  factory DeviceMetadata({
    $core.double? physicalWidth,
    $core.double? physicalHeight,
    $core.double? devicePixelRatio,
  }) {
    final _result = create();
    if (physicalWidth != null) {
      _result.physicalWidth = physicalWidth;
    }
    if (physicalHeight != null) {
      _result.physicalHeight = physicalHeight;
    }
    if (devicePixelRatio != null) {
      _result.devicePixelRatio = devicePixelRatio;
    }
    return _result;
  }
  factory DeviceMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceMetadata clone() => DeviceMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceMetadata copyWith(void Function(DeviceMetadata) updates) => super.copyWith((message) => updates(message as DeviceMetadata)) as DeviceMetadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceMetadata create() => DeviceMetadata._();
  DeviceMetadata createEmptyInstance() => create();
  static $pb.PbList<DeviceMetadata> createRepeated() => $pb.PbList<DeviceMetadata>();
  @$core.pragma('dart2js:noInline')
  static DeviceMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceMetadata>(create);
  static DeviceMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get physicalWidth => $_getN(0);
  @$pb.TagNumber(1)
  set physicalWidth($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhysicalWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhysicalWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get physicalHeight => $_getN(1);
  @$pb.TagNumber(2)
  set physicalHeight($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhysicalHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhysicalHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get devicePixelRatio => $_getN(2);
  @$pb.TagNumber(3)
  set devicePixelRatio($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDevicePixelRatio() => $_has(2);
  @$pb.TagNumber(3)
  void clearDevicePixelRatio() => clearField(3);
}

