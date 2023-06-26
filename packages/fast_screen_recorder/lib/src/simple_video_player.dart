import 'dart:async';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoPlayer extends StatefulWidget {
  final String pathVideo;
  final void Function(VideoPlayerValue) onVideoPlayerEvent;
  final double aspectRatio;

  const SimpleVideoPlayer({
    super.key,
    required this.pathVideo,
    required this.onVideoPlayerEvent,
    required this.aspectRatio,
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
    _videoPlayerController?.removeListener(_handleVideoPlayerEvent);
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

    _videoPlayerController!.addListener(_handleVideoPlayerEvent);

    // https://github.com/brianegan/chewie/issues/174#issuecomment-519102765
    await _videoPlayerController!.initialize();

    if (!mounted) return;
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        aspectRatio: widget.aspectRatio,
        autoPlay: true,
        looping: false,
        showControlsOnInitialize: false,
        customControls: const MaterialControls(),
      );
    });
  }

  void _handleVideoPlayerEvent() {
    widget.onVideoPlayerEvent(_videoPlayerController!.value);
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

    return Chewie(
      controller: _chewieController!,
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
