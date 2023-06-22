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
    _data.methodCallRecords.add(record.temporaryClone());
  }

  void handlePushOp(EngineLayer result, SceneBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.temporaryClone());
    result.record = record;
  }

  void handleAddRetainedOp(EngineLayer retainedLayer) {
    // NOTE use the stored opRecord
    // TODO no need to do this, it can be large to store
    _data.methodCallRecords.add(retainedLayer.record!);
  }
}
