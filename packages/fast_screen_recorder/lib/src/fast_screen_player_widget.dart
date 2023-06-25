import 'dart:io';

import 'package:fast_screen_recorder/src/interaction/interaction_player.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fast_screen_recorder/src/recorder/metadata_pack_codec.dart';
import 'package:fast_screen_recorder/src/simple_video_player.dart';
import 'package:fast_screen_recorder/src/time_converter.dart';
import 'package:flutter/material.dart';

class FastScreenPlayerWidget extends StatelessWidget {
  final String pathVideo;
  final String pathMetadata;

  const FastScreenPlayerWidget({super.key, required this.pathVideo, required this.pathMetadata});

  @override
  Widget build(BuildContext context) {
    return _FastScreenPlayerInnerWidget(
      key: ValueKey((pathVideo, pathMetadata)),
      pathVideo: pathVideo,
      pathMetadata: pathMetadata,
    );
  }
}

class _FastScreenPlayerInnerWidget extends StatefulWidget {
  final String pathVideo;
  final String pathMetadata;

  const _FastScreenPlayerInnerWidget({super.key, required this.pathVideo, required this.pathMetadata});

  @override
  State<_FastScreenPlayerInnerWidget> createState() => __FastScreenPlayerInnerWidgetState();
}

class __FastScreenPlayerInnerWidgetState extends State<_FastScreenPlayerInnerWidget> {
  late proto.RecorderMetadataPack metadata;
  var wallclockTime = Duration.zero;

  @override
  void initState() {
    super.initState();

    // for simplicity, read by sync, not async, since the only users of the widget is us developers ;)
    final bytes = File(widget.pathMetadata).readAsBytesSync();
    setState(() => metadata = metadataPackCodec.decode(bytes));
  }

  @override
  void didUpdateWidget(covariant _FastScreenPlayerInnerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(oldWidget.pathVideo == widget.pathVideo && oldWidget.pathMetadata == widget.pathMetadata);
  }

  void _handleVideoPositionChanged(Duration videoTime) {
    setState(() {
      wallclockTime = TimeConverter.videoToWallclockTime(videoTime, metadata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleVideoPlayer(
          key: ValueKey(widget.pathVideo),
          pathVideo: widget.pathVideo,
          onPositionChanged: _handleVideoPositionChanged,
        ),
        InteractionPlayer(
          pack: metadata.interaction,
          wallclockTimestamp: wallclockTime,
        ),
      ],
    );
  }
}
