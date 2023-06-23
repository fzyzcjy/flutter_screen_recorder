import 'package:screen_recorder/src/delegate_base/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/canvas.dart';
import 'package:screen_recorder/src/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/scene_builder.dart';

class RecordList<MR> {
  final List<MR> methodCallRecords;

  RecordList({
    required this.methodCallRecords,
  });
}

class RecordListWithConstructor<CR, MR> extends RecordList<MR> {
  late CR constructorRecord;

  RecordListWithConstructor({
    CR? constructorRecord,
    required super.methodCallRecords,
  }) {
    if (constructorRecord != null) this.constructorRecord = constructorRecord;
  }
}

class ParagraphBuilderRecordList
    extends RecordListWithConstructor<ParagraphBuilder_Constructor_Record, ParagraphBuilder_RecordBase> {
  final int id;

  ParagraphBuilderRecordList({
    required this.id,
    super.constructorRecord,
    required super.methodCallRecords,
  });
}

class CanvasRecordList extends RecordList<Canvas_RecordBase> {
  CanvasRecordList({required super.methodCallRecords});
}

class SceneBuilderRecordList extends RecordList<SceneBuilder_RecordBase> {
  SceneBuilderRecordList({required super.methodCallRecords});
}
