import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:fast_screen_recorder/src/session_recorder/session_recorder.dart';
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

        await VideoAndMetadataPacker.pack(
          inputPathVideo: recordingData.pathVideo,
          inputPathMetadata: recordingData.pathMetadata,
          outputPathPack: recordingData.pathPack,
        );
      });

  /// See [SessionRecorder.disposeForTests] for doc
  void disposeForTests() {
    _recorder.disposeForTests();
  }
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
  // TODO may improve it by streaming instead of reading to memory, but since everything <1MB, it looks ok
  // thus we keep this file-based signature to allow future optimization
  static Future<void> pack({
    required String inputPathMetadata,
    required String inputPathVideo,
    required String outputPathPack,
  }) async {
    final metadataBytes = await File(inputPathMetadata).readAsBytes();
    final videoBytes = await File(inputPathVideo).readAsBytes();

    // ignore: deprecated_export_use
    final builder = BytesBuilder(copy: false)
      ..add((ByteData(8)..setInt64(0, metadataBytes.length)).buffer.asUint8List())
      ..add(metadataBytes)
      ..add(videoBytes);

    await File(outputPathPack).writeAsBytes(builder.takeBytes());
  }

  static Future<void> unpack({
    required String inputPathPack,
    required String outputPathMetadata,
    required String outputPathVideo,
  }) async {
    final bytes = await File(inputPathPack).readAsBytes();

    const headerLength = 8;
    final metadataBytesLength = ByteData.view(bytes.buffer).getInt64(0);

    await File(outputPathMetadata).writeAsBytes(bytes.sublist(headerLength, headerLength + metadataBytesLength));
    await File(outputPathVideo).writeAsBytes(bytes.sublist(headerLength + metadataBytesLength));
  }
}
