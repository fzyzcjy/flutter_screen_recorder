import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/scene_builder_record.dart';

SceneBuilderRecord get _data => DataPerFrame.instance.sceneBuilderData;

mixin MySceneBuilderMixin {
  SceneBuilder get proxy;

  void handleMiscOp<T>(T result, SceneBuilder_RecordBase<Object?> record) {
    _data.ops.add(record.safeClone());
  }

  void handlePushOp(EngineLayer result, SceneBuilder_RecordBase<Object?> record) {
    _data.ops.add(record.safeClone());
    result.opRecord = record;
  }

  void handleAddRetainedOp(EngineLayer retainedLayer) {
    // NOTE use the stored opRecord
    _data.ops.add(retainedLayer.opRecord!);
  }
}
