import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/scene_builder_record.dart';

SceneBuilderRecord get _data => DataPerFrame.instance.sceneBuilderData;

mixin MySceneBuilderMixin {
  SceneBuilder get proxy;

  void _addOp(SceneBuilderOpAddRecord opRecord) {
    _data.ops.add(opRecord.safeClone());
    opRecord.execute(proxy);
  }

  T _pushOp<T extends EngineLayer>(SceneBuilderOpPushRecord<T> opRecord, {required T? oldLayer}) {
    _data.ops.add(opRecord.safeClone());
    final innerResult = opRecord.execute(proxy, oldLayer: oldLayer);

    innerResult.opRecord = opRecord;

    return innerResult;
  }
}
