import 'package:screen_recorder/src/delegate_base/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/canvas.dart';
import 'package:screen_recorder/src/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/scene_builder.dart';
import 'package:screen_recorder/src/referable.dart';

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
    extends RecordListWithConstructor<ParagraphBuilder_Constructor_Record, ParagraphBuilder_RecordBase>
    implements ReferableObject {
  static var _nextObjectId = 1;

  @override
  final int objectId;

  ParagraphBuilderRecordList({
    int? objectId,
    super.constructorRecord,
    required super.methodCallRecords,
  }) : objectId = objectId ?? _nextObjectId++;
}

class CanvasRecordList extends RecordList<Canvas_RecordBase> implements ReferableObject {
  static var _nextObjectId = 1;

  @override
  final int objectId;

  CanvasRecordList({
    int? objectId,
    required super.methodCallRecords,
  }) : objectId = objectId ?? _nextObjectId++;
}

class SceneBuilderRecordList extends RecordList<SceneBuilder_RecordBase> {
  SceneBuilderRecordList({required super.methodCallRecords});
}
