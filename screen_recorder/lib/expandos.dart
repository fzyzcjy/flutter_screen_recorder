import 'dart:ui';

import 'package:screen_recorder/scene_builder_record.dart';

extension ExtEngineLayerExpando on EngineLayer {
  static final _expando = Expando<SceneBuilderOpRecord>('EngineLayer.opRecord');

  SceneBuilderOpRecord? get opRecord => _expando[this];

  set opRecord(SceneBuilderOpRecord? value) => _expando[this] = value;
}
