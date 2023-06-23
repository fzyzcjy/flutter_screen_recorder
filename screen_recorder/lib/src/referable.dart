import 'package:screen_recorder/src/serialization.dart';

class ReferableReadContext<T> {
  final _objectOfIdMap = <int, T>{};
}

class ReferableWriteContext<T> {
  final _serializedIds = <int>{};
}

abstract class ReferableObject {
  int get objectId;
}

T fromBytesReferable<T extends ReferableObject>(
    ContextBytesReader reader, ReferableReadContext<T> context, T Function() fromBytesInner) {
  final seen = fromBytesBool(reader);

  if (seen) {
    final objectId = fromBytesInt(reader);
    return context._objectOfIdMap[objectId]!;
  } else {
    final result = fromBytesInner();
    context._objectOfIdMap[result.objectId] = result;
    return result;
  }
}

void toBytesReferable<T extends ReferableObject>(
    ContextBytesWriter writer, ReferableWriteContext<T> context, T value, void Function() toBytesInner) {
  final objectId = value.objectId;

  final seen = context._serializedIds.contains(objectId);
  if (!seen) context._serializedIds.add(objectId);

  toBytesBool(writer, seen);
  if (seen) {
    toBytesInt(writer, objectId);
  } else {
    toBytesInner();
  }
}
