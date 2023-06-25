import 'dart:io';

import 'package:fast_screen_recorder/src/interaction/interaction_player.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fast_screen_recorder/src/recorder/metadata_pack_codec.dart';
import 'package:fast_screen_recorder/src/simple_video_player.dart';
import 'package:flutter/material.dart';

class FastScreenPlayerWidget extends StatefulWidget {
  final String pathVideo;
  final String pathMetadata;

  const FastScreenPlayerWidget({super.key, required this.pathVideo, required this.pathMetadata});

  @override
  State<FastScreenPlayerWidget> createState() => _FastScreenPlayerWidgetState();
}

class _FastScreenPlayerWidgetState extends State<FastScreenPlayerWidget> {
  late proto.RecorderMetadataPack metadata;

  @override
  void initState() {
    super.initState();
    _readMetadata();
  }

  @override
  void didUpdateWidget(covariant FastScreenPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pathMetadata != widget.pathMetadata) _readMetadata();
  }

  void _readMetadata() {
    // for simplicity, read by sync, not async, since the only users of the widget is us developers ;)
    final bytes = File(widget.pathMetadata).readAsBytesSync();
    setState(() => metadata = metadataPackCodec.decode(bytes));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleVideoPlayer(
          key: ValueKey(widget.pathVideo),
          pathVideo: widget.pathVideo,
        ),
        InteractionPlayer(
          pack: metadata.interaction,
          timestamp: TODO,
        ),
      ],
    );
  }
}
