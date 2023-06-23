import 'package:screen_recorder/src/serialization/context.dart';

class ReferableWriteContext {}

class ReferableReadContext {}

T fromBytesReferable<T>(ContextBytesReader reader, ReferableReadContext context, T Function() fromBytesInner) {
  return TODO;
}

void toBytesReferable<T>(
    ContextBytesWriter writer, ReferableWriteContext context, T value, void Function() toBytesInner) {
  TODO;
}
