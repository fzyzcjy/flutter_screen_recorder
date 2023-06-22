import 'dart:ui';

import 'package:screen_recorder/delegate_base/paragraph.dart';
import 'package:screen_recorder/record_list.dart';

// extension ExtEngineLayerSceneBuilderRecordExpando on EngineLayer {
//   static final _expando = Expando<SceneBuilder_RecordBase>('EngineLayer.sceneBuilderRecord');
//
//   SceneBuilder_RecordBase? get sceneBuilderRecord => _expando[this];
//
//   set sceneBuilderRecord(SceneBuilder_RecordBase? value) => _expando[this] = value;
// }

extension ExtEngineLayerLayerIdExpando on EngineLayer {
  static final _expando = Expando<int>('EngineLayer.layerId');

  int? get layerId => _expando[this];

  set layerId(int? value) => _expando[this] = value;

  static var _nextDefaultId = 1;

  int getOrCreateLayerId() => layerId ??= _nextDefaultId++;
}

extension ExtParagraphBuilderRecordListExpando on Paragraph {
  static final _expando = Expando<ParagraphBuilderRecordList>('Paragraph.paragraphBuilderRecordList');

  ParagraphBuilderRecordList? get paragraphBuilderRecordList => _expando[this];

  set paragraphBuilderRecordList(ParagraphBuilderRecordList? value) => _expando[this] = value;
}

extension ExtParagraphRecordExpando on Paragraph {
  static final _expando = Expando<ParagraphRecord>('Paragraph.paragraphRecord');

  ParagraphRecord? get paragraphRecord => _expando[this];

  set paragraphRecord(ParagraphRecord? value) => _expando[this] = value;
}

extension ExtPictureExpando on Picture {
  static final _expando = Expando<CanvasRecordList>('Picture.canvasRecordList');

  CanvasRecordList? get canvasRecordList => _expando[this];

  set canvasRecordList(CanvasRecordList? value) => _expando[this] = value;
}
