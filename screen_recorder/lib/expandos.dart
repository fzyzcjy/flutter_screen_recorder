import 'dart:ui';

import 'package:screen_recorder/generated/record/scene_builder.dart';

extension ExtEngineLayerExpando on EngineLayer {
  static final _expando = Expando<SceneBuilder_RecordBase>('EngineLayer.opRecord');

  SceneBuilder_RecordBase? get opRecord => _expando[this];

  set opRecord(SceneBuilder_RecordBase? value) => _expando[this] = value;
}
