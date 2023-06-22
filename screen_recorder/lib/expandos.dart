import 'dart:ui';

import 'package:screen_recorder/generated/record/scene_builder.dart';

extension ExtEngineLayerExpando on EngineLayer {
  static final _expando = Expando<SceneBuilder_RecordBase>('EngineLayer.opRecord');

  SceneBuilder_RecordBase? get record => _expando[this];

  set record(SceneBuilder_RecordBase? value) => _expando[this] = value;
}
