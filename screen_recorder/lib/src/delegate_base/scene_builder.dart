// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:screen_recorder/src/expandos.dart';
import 'package:screen_recorder/src/generated/record/scene_builder.dart';
import 'package:screen_recorder/src/record_list.dart';

abstract class MySceneBuilderBase {
  final SceneBuilder proxy;
  final _data = SceneBuilderRecordList(methodCallRecords: []);

  MySceneBuilderBase(this.proxy);

  void handleMiscOp<T>(T result, SceneBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.temporaryClone());
  }

  void handlePushOp(EngineLayer result, SceneBuilder_RecordBase<Object?> record) {
    _data.methodCallRecords.add(record.temporaryClone());
    // result.sceneBuilderRecord = record;
  }

  void handleAddRetainedOp(void result, SceneBuilder_AddRetained_Record record) {
    _data.methodCallRecords.add(record.temporaryClone());
  }

  void handleBuildOp(Scene result) {
    result.sceneBuilderRecordList = _data;
  }
}

class SceneBuilder_RecordExecuteContext {
  final Map<int, EngineLayer> mutableEngineLayerIdMap;

  SceneBuilder_RecordExecuteContext({required this.mutableEngineLayerIdMap});

  EngineLayer getEngineLayerById(int layerId) =>
      mutableEngineLayerIdMap[layerId] ?? (throw ArgumentError('Cannot find layerId=$layerId'));

  void putEngineLayerId(int layerId, EngineLayer engineLayer) {
    // assert(!nextEngineLayerIdMap.containsKey(layerId)); // #9607 should re-enable
    mutableEngineLayerIdMap[layerId] = engineLayer;
  }

  void putRetainedEngineLayerId(int layerId) {
    putEngineLayerId(layerId, getEngineLayerById(layerId));
  }
}
