import 'dart:ui';

import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/record_list.dart';

extension ExtEngineLayerExpando on EngineLayer {
  static final _expando = Expando<SceneBuilder_RecordBase>('EngineLayer.sceneBuilderRecord');

  SceneBuilder_RecordBase? get sceneBuilderRecord => _expando[this];

  set sceneBuilderRecord(SceneBuilder_RecordBase? value) => _expando[this] = value;
}

extension ExtParagraphBuilderRecordListExpando on Paragraph {
  static final _expando = Expando<ParagraphBuilderRecordList>('Paragraph.paragraphBuilderRecordList');

  ParagraphBuilderRecordList? get paragraphBuilderRecordList => _expando[this];

  set paragraphBuilderRecordList(ParagraphBuilderRecordList? value) => _expando[this] = value;
}

extension ExtPictureExpando on Picture {
  static final _expando = Expando<CanvasRecordList>('Picture.canvasRecordList');

  CanvasRecordList? get canvasRecordList => _expando[this];

  set canvasRecordList(CanvasRecordList? value) => _expando[this] = value;
}
