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
    ..hasRequiredFields = false
  ;

  RecorderMetadataPack._() : super();
  factory RecorderMetadataPack({
    InteractionPack? interaction,
  }) {
    final _result = create();
    if (interaction != null) {
      _result.interaction = interaction;
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
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestampMicros')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positionDx', $pb.PbFieldType.OF)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positionDy', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  PointerEvent._() : super();
  factory PointerEvent({
    $fixnum.Int64? timestampMicros,
    $core.double? positionDx,
    $core.double? positionDy,
  }) {
    final _result = create();
    if (timestampMicros != null) {
      _result.timestampMicros = timestampMicros;
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
  $fixnum.Int64 get timestampMicros => $_getI64(0);
  @$pb.TagNumber(1)
  set timestampMicros($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestampMicros() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestampMicros() => clearField(1);

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

