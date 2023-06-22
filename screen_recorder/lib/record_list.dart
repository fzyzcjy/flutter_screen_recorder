import 'package:screen_recorder/delegate_base/paragraph_builder.dart';
import 'package:screen_recorder/generated/record/canvas.dart';
import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';

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

typedef ParagraphBuilderRecordList
    = RecordListWithConstructor<ParagraphBuilder_Constructor_Record, ParagraphBuilder_RecordBase>;
typedef CanvasRecordList = RecordList<Canvas_RecordBase>;
typedef SceneBuilderRecordList = RecordList<SceneBuilder_RecordBase>;
