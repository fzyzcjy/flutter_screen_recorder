import 'dart:ui';

import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/manual/canvas.dart';
import 'package:screen_recorder/manual/paragraph_builder.dart';

extension ExtEngineLayerExpando on EngineLayer {
  static final _expando = Expando<SceneBuilder_RecordBase>('EngineLayer.opRecord');

  SceneBuilder_RecordBase? get record => _expando[this];

  set record(SceneBuilder_RecordBase? value) => _expando[this] = value;
}

extension ExtParagraphExpando on Paragraph {
  static final _expando = Expando<ParagraphBuilderRecordList>('Paragraph.record');

  ParagraphBuilderRecordList? get record => _expando[this];

  set record(ParagraphBuilderRecordList? value) => _expando[this] = value;
}

extension ExtPictureExpando on Picture {
  static final _expando = Expando<CanvasRecordList>('Picture.record');

  CanvasRecordList? get record => _expando[this];

  set record(CanvasRecordList? value) => _expando[this] = value;
}
