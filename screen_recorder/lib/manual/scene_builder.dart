import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/records.dart';

typedef SceneBuilderRecordList = RecordList<void, SceneBuilder_RecordBase>;

SceneBuilderRecordList get _data => DataPerFrame.instance.sceneBuilderData;

abstract class MySceneBuilderBase {
  final SceneBuilder proxy;

  MySceneBuilderBase(this.proxy);

  void handleMiscOp<T>(T result, SceneBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.safeClone());
  }

  void handlePushOp(EngineLayer result, SceneBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.safeClone());
    result.record = record;
  }

  void handleAddRetainedOp(EngineLayer retainedLayer) {
    // NOTE use the stored opRecord
    _data.ops.add(retainedLayer.record!);
  }
}
