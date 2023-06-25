import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoPlayer extends StatefulWidget {
  final String pathVideo;

  const SimpleVideoPlayer({
    super.key,
    required this.pathVideo,
  });

  @override
  State<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
}

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  var _hasError = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant SimpleVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(oldWidget.pathVideo == widget.pathVideo);
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    unawaited(_videoPlayerController?.dispose());
    super.dispose();
  }

  Future<void> _init() async {
    final VideoPlayerController createdController;
    try {
      createdController = VideoPlayerController.file(File(widget.pathVideo));
    } catch (e, s) {
      debugPrint('WARN: error when init e=$e s=$s');
      // #6792
      if (mounted) {
        setState(() => _hasError = true);
      }
      return;
    }

    if (!mounted) return;
    setState(() => _videoPlayerController = createdController);

    // https://github.com/brianegan/chewie/issues/174#issuecomment-519102765
    await _videoPlayerController!.initialize();

    final aspectRatio = _videoPlayerController!.value.aspectRatio;
    debugPrint('aspectRatio=$aspectRatio');

    if (!mounted) return;
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        // NOTE aspectRatio
        aspectRatio: aspectRatio,
        autoPlay: false,
        looping: false,
        showControlsOnInitialize: true,
        customControls: const MaterialControls(),
      );
    });
  }

  static const kPlaceholderHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return _buildPlaceholder(
        child: const Center(
          child: Text(
            'Load failed',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    final videoPlayerController = _videoPlayerController;
    if (videoPlayerController == null || !videoPlayerController.value.isInitialized) {
      return _buildPlaceholder(
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    return ColoredBox(
      color: Theme.of(context).colorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: AspectRatio(
          aspectRatio: max(videoPlayerController.value.aspectRatio, 1 / 1),
          child: Chewie(
            controller: _chewieController!,
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder({required Widget child}) {
    return Container(
      height: kPlaceholderHeight,
      color: Colors.grey.shade100,
      child: child,
    );
  }
}