import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/scene_builder_record.dart';

SceneBuilderRecord get _data => DataPerFrame.instance.sceneBuilderData;

mixin MySceneBuilderMixin {
  SceneBuilder get proxy;

  void handleMiscOp<T>(SceneBuilder_RecordBase<Object?> record, T result) {
    _data.ops.add(record.safeClone());
  }

  void handlePushOp(SceneBuilder_RecordBase<Object?> record, EngineLayer result) {
    _data.ops.add(record.safeClone());
    result.opRecord = record;
  }
}
