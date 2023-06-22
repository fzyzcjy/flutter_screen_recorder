import 'dart:convert';
import 'dart:typed_data';

void toBytesEnum(BytesBuilder builder, Enum value) {
  toBytesUint8(builder, value.index);
}

void toBytesUint8(BytesBuilder builder, int value) {
  assert(value >= 0 && value <= 255);
  builder.addByte(value);
}

void toBytesDouble(BytesBuilder builder, double value) {
  // TODO consider byte order
  builder.add((Float64List(1)..[0] = value).buffer.asUint8List());
}

void toBytesString(BytesBuilder builder, String value) {
  // TODO add string length information
  builder.add(utf8.encode(value));
}
