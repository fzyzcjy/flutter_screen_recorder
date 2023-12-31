import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:fast_screen_recorder/src/interaction/interaction_player.dart';
import 'package:fast_screen_recorder/src/protobuf/extensions.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fast_screen_recorder/src/recorder/metadata_pack_codec.dart';
import 'package:fast_screen_recorder/src/simple_video_player.dart';
import 'package:fast_screen_recorder/src/time_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:video_player/video_player.dart';

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

  var time = _RecordAndReplayWallclockTime.dummy();
  var playing = false;

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

  void _handleVideoPlayerEvent(VideoPlayerValue e) {
    setState(() {
      time = _RecordAndReplayWallclockTime(
        recordWallclockTime: TimeConverter.videoToWallclockTime(e.position, metadata),
        replayWallclockTime: clock.now(),
      );
      playing = e.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _PlayerSizeDeterminator(
      deviceMetadata: metadata.device,
      builder: (_, displayScale) => Material(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SimpleVideoPlayer(
              key: ValueKey(widget.pathVideo),
              pathVideo: widget.pathVideo,
              onVideoPlayerEvent: _handleVideoPlayerEvent,
              aspectRatio: metadata.device.size.aspectRatio,
            ),
            IgnorePointer(
              child: _TimeInterpolationWidget(
                time: time,
                playing: playing,
                builder: (_, interpolatedWallclockTimestamp) => InteractionPlayer(
                  pack: metadata.interaction,
                  wallclockTimestamp: interpolatedWallclockTimestamp,
                  displayScale: displayScale,
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 8,
              child: Text(
                '${time.recordWallclockTime}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordAndReplayWallclockTime {
  final DateTime recordWallclockTime;
  final DateTime replayWallclockTime;

  const _RecordAndReplayWallclockTime({
    required this.recordWallclockTime,
    required this.replayWallclockTime,
  });

  factory _RecordAndReplayWallclockTime.dummy() => _RecordAndReplayWallclockTime(
        recordWallclockTime: clock.now(),
        replayWallclockTime: clock.now(),
      );
}

class _TimeInterpolationWidget extends StatefulWidget {
  final _RecordAndReplayWallclockTime time;
  final bool playing;

  final Widget Function(BuildContext, DateTime) builder;

  const _TimeInterpolationWidget({
    required this.time,
    required this.playing,
    required this.builder,
  });

  @override
  State<_TimeInterpolationWidget> createState() => _TimeInterpolationWidgetState();
}

class _TimeInterpolationWidgetState extends State<_TimeInterpolationWidget> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_handleTick);
    _updateTickerState();
  }

  @override
  void didUpdateWidget(covariant _TimeInterpolationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    _updateTickerState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _updateTickerState() {
    if (widget.playing && !_ticker.isActive) _ticker.start();
    if (!widget.playing && _ticker.isActive) _ticker.stop();
  }

  void _handleTick(Duration _) => setState(() {});

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.time.recordWallclockTime
          .add(widget.playing ? clock.now().difference(widget.time.replayWallclockTime) : Duration.zero),
    );
  }
}

class _PlayerSizeDeterminator extends StatelessWidget {
  final proto.DeviceMetadata deviceMetadata;
  final Widget Function(BuildContext context, double displayScale) builder;

  const _PlayerSizeDeterminator({required this.deviceMetadata, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (_, constraints) {
        assert(constraints.biggest.isFinite);

        final aspectRatio = deviceMetadata.size.aspectRatio;

        final chosenWidth = min(constraints.biggest.width, constraints.biggest.height * aspectRatio);
        final chosenHeight =
            min(constraints.biggest.height, chosenWidth / aspectRatio); // clamp to avoid rounding error

        // normally should not happen, may be caused by legacy data (no aspect ratio)
        // https://github.com/fzyzcjy/yplusplus/issues/9716#issuecomment-1607498904
        if (chosenWidth.isNaN || chosenHeight.isNaN) return const Text('invalid chosen size (nan)');

        final chosenSize = Size(chosenWidth, chosenHeight);
        assert(constraints.isSatisfiedBy(chosenSize), 'constraints=$constraints chosenSize=$chosenSize');

        final chosenScale = chosenSize.width / deviceMetadata.size.width;

        return SizedBox.fromSize(
          size: chosenSize,
          child: builder(context, chosenScale),
        );
      }),
    );
  }
}
