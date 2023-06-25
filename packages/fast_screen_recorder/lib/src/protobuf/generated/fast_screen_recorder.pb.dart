///
//  Generated code. Do not modify.
//  source: fast_screen_recorder.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RecorderMetadataPack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RecorderMetadataPack', createEmptyInstance: create)
    ..aOM<InteractionPack>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'interaction', subBuilder: InteractionPack.create)
    ..aOM<VideoMetadataPack>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video', subBuilder: VideoMetadataPack.create)
    ..hasRequiredFields = false
  ;

  RecorderMetadataPack._() : super();
  factory RecorderMetadataPack({
    InteractionPack? interaction,
    VideoMetadataPack? video,
  }) {
    final _result = create();
    if (interaction != null) {
      _result.interaction = interaction;
    }
    if (video != null) {
      _result.video = video;
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
    ..hasRequiredFields = false
  ;

  PointerEvent._() : super();
  factory PointerEvent({
    $fixnum.Int64? flutterTimestampMicros,
    $core.double? positionDx,
    $core.double? positionDy,
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
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flutterTimestampMicros')
    ..hasRequiredFields = false
  ;

  VideoFrameInfo._() : super();
  factory VideoFrameInfo({
    $fixnum.Int64? flutterTimestampMicros,
  }) {
    final _result = create();
    if (flutterTimestampMicros != null) {
      _result.flutterTimestampMicros = flutterTimestampMicros;
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
  $fixnum.Int64 get flutterTimestampMicros => $_getI64(0);
  @$pb.TagNumber(1)
  set flutterTimestampMicros($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFlutterTimestampMicros() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlutterTimestampMicros() => clearField(1);
}

