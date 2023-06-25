import 'dart:math';

import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

class FastPackedScreenRecorder {
  static final instance = FastPackedScreenRecorder._();

  FastPackedScreenRecorder._();

  _RecordingData? _recordingData;

  final _lock = Lock();

  final _recorder = FastScreenRecorder.instance;

  Future<void> start({
    required String path,
    VideoConfig videoConfig = const VideoConfig(),
  }) async =>
      await _lock.synchronized(() async {
        final dirTemp = await getTemporaryDirectory();
        final stem = '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(100000000)}';

        // not ".mp4" since we will support different video formats
        final pathVideo = '${dirTemp.path}/$stem.bin';
        final pathMetadata = '${dirTemp.path}/$stem.meta';

        await _recorder.start(pathVideo: pathVideo, pathMetadata: pathMetadata, videoConfig: videoConfig);

        _recordingData = _RecordingData(pathVideo: pathVideo, pathMetadata: pathMetadata, pathPack: path);
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        await _recorder.stop();

        final recordingData = _recordingData!;
        _recordingData = null;

        VideoAndMetadataPacker.pack(
          inputPathVideo: recordingData.pathVideo,
          inputPathMetadata: recordingData.pathMetadata,
          outputPathPack: recordingData.pathPack,
        );
      });
}

class _RecordingData {
  final String pathVideo;
  final String pathMetadata;
  final String pathPack;

  _RecordingData({
    required this.pathVideo,
    required this.pathMetadata,
    required this.pathPack,
  });
}

class VideoAndMetadataPacker {
  static Future<void> pack({
    required String inputPathVideo,
    required String inputPathMetadata,
    required String outputPathPack,
  }) async {
    TODO;
  }

  static Future<void> unpack({
    required String inputPathPack,
    required String outputPathVideo,
    required String outputPathMetadata,
  }) async {
    TODO;
  }
}
