// ====================================================================================
// NOTE: COPIED FROM INTERNAL LIBRARY front_log, PLEASE KEEP IN SYNC
// ====================================================================================

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart';

class TimeNamedDirectoryManager {
  final FileSystem fs;
  final String directory;

  final _FileNamer _fileNamer;

  TimeNamedDirectoryManager({
    this.fs = const LocalFileSystem(),
    required this.directory,
    required String extension,
  }) : _fileNamer = _FileNamer(suffix: '.$extension');

  String getPathForTime(DateTime time) => '$directory/${_fileNamer.create(time)}';

  Future<void> prune({
    required int maxKeepSize,
    required int maxKeepNumFile,
  }) async {
    var cumSize = 0;
    var count = 0;
    for (final fileInfo in (await getAllOrdered()).reversed) {
      cumSize += await fileInfo.file.length();
      count++;
      if (cumSize >= maxKeepSize || count > maxKeepNumFile) {
        await fileInfo.file.delete();
      }
    }
  }

  Future<List<FileAndTimeInfo>> getAllOrdered({DateTime? startTime, DateTime? endTime}) async {
    final fileInfos = (await fs.directory(directory).list().toList())
        .whereType<File>()
        .map((path) {
          final time = _fileNamer.tryParse(basename(path.path));
          if (time == null) return null;
          return FileAndTimeInfo(path, time);
        })
        .whereNotNull()
        .toList();

    fileInfos.sortBy<num>((e) => e.time.microsecondsSinceEpoch);

    return fileInfos;
  }

  Future<List<FileAndTimeInfo>> getRange({
    required DateTime startTime,
    required DateTime endTime,
    int? roughMaxSize,
  }) async {
    final allFileInfos = await getAllOrdered();

    final startIndexByStartTime =
        max(0, -1 + allFileInfos.lowerBoundBy(FileAndTimeInfo(fs.file(''), startTime), (e) => e.time));
    final endIndex = allFileInfos.lowerBoundBy(FileAndTimeInfo(fs.file(''), endTime), (e) => e.time);

    final startIndex = roughMaxSize == null
        ? startIndexByStartTime
        : await () async {
            var cumSize = 0;
            for (var i = endIndex - 1; i >= startIndexByStartTime; --i) {
              cumSize += await allFileInfos[i].file.length();
              if (cumSize >= roughMaxSize) return i;
            }
            return startIndexByStartTime;
          }();

    return allFileInfos.sublist(startIndex, endIndex);
  }
}

class FileAndTimeInfo {
  final File file;
  final DateTime time;

  const FileAndTimeInfo(this.file, this.time);

  @override
  String toString() => 'FileAndTimeInfo($file, $time)';
}

class _FileNamer {
  final String suffix;

  const _FileNamer({required this.suffix});

  String create(DateTime time) {
    return time.microsecondsSinceEpoch.toString() + suffix;
  }

  // need to "try", since if somehow the folder is corrupted with weird files, it should not crash
  DateTime? tryParse(String name) {
    final timeString = name.stripSuffix(suffix);
    if (timeString == null) return null;

    final timeInt = int.tryParse(timeString);
    if (timeInt == null) return null;

    return DateTime.fromMicrosecondsSinceEpoch(timeInt);
  }
}

extension on String {
  String? stripSuffix(String suffix) => endsWith(suffix) ? substring(0, length - suffix.length) : null;
}
