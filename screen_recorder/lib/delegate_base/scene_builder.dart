// ignore_for_file: camel_case_types

import 'dart:collection';
import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/record_list.dart';

SceneBuilderRecordList get _data => DataPerFrame.instance.sceneBuilderData;

abstract class MySceneBuilderBase {
  final SceneBuilder proxy;

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
}

class SceneBuilder_RecordExecuteContext {
  final UnmodifiableMapView<int, EngineLayer> prevEngineLayerIdMap;
  final nextEngineLayerIdMap = <int, EngineLayer>{};

  SceneBuilder_RecordExecuteContext({required this.prevEngineLayerIdMap});

  EngineLayer getEngineLayerById(int layerId) => prevEngineLayerIdMap[layerId]!;

  void putEngineLayerId(int layerId, EngineLayer engineLayer) {
    assert(!nextEngineLayerIdMap.containsKey(layerId));
    nextEngineLayerIdMap[layerId] = engineLayer;
  }
}
