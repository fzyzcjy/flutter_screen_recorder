import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:flutter/material.dart';

class InteractionPlayer extends StatelessWidget {
  final proto.InteractionPack pack;
  final Duration timestamp;

  const InteractionPlayer({
    super.key,
    required this.pack,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return TODO;
  }
}
