import 'package:screen_recorder/src/serialization.dart';
import 'package:screen_recorder/src/serialization/context.dart';

class ReferableReadContext<T> {
  final _objectOfIdMap = <int, T>{};
}

class ReferableWriteContext<T> {
  final _serializedIds = <int>{};
}

T fromBytesReferable<T>(ContextBytesReader reader, ReferableReadContext<T> context, T Function() fromBytesInner) {
  final seen = fromBytesBool(reader);

  if (seen) {
    final objectId = fromBytesInt(reader);
    return context._objectOfIdMap[objectId] as T;
  } else {
    final result = fromBytesInner();
    context._objectOfIdMap[objectId] = result;
    return result;
  }
}

void toBytesReferable<T>(
    ContextBytesWriter writer, ReferableWriteContext<T> context, T value, void Function() toBytesInner) {
  final objectId = TODO;

  final seen = context._serializedIds.contains(objectId);
  if (!seen) context._serializedIds.add(objectId);

  toBytesBool(writer, seen);
  if (seen) {
    toBytesInt(writer, objectId);
  } else {
    toBytesInner();
  }
}
