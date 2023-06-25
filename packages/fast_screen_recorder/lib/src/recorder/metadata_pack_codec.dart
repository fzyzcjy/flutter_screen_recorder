import 'dart:convert';
import 'dart:io';

import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:protobuf/protobuf.dart';

final Codec<proto.RecorderMetadataPack, List<int>> metadataPackCodec =
    const ProtobufCodec(fromBuffer: proto.RecorderMetadataPack.fromBuffer).fuse(GZipCodec());

class ProtobufCodec<T extends GeneratedMessage> extends Codec<T, List<int>> {
  final T Function(List<int>) fromBuffer;

  const ProtobufCodec({required this.fromBuffer});

  @override
  Converter<List<int>, T> get decoder => ProtobufDecoder<T>(fromBuffer: fromBuffer);

  @override
  Converter<T, List<int>> get encoder => ProtobufEncoder<T>();
}

class ProtobufEncoder<T extends GeneratedMessage> extends Converter<T, List<int>> {
  const ProtobufEncoder();

  @override
  List<int> convert(T input) => input.writeToBuffer();
}

class ProtobufDecoder<T extends GeneratedMessage> extends Converter<List<int>, T> {
  final T Function(List<int>) fromBuffer;

  const ProtobufDecoder({required this.fromBuffer});

  @override
  T convert(List<int> input) => fromBuffer(input);
}
