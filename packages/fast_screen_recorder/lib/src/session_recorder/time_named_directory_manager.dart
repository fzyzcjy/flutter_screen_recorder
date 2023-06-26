import 'dart:math';

import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart';

// ====================================================================================
// NOTE: COPIED FROM INTERNAL LIBRARY front_log, PLEASE KEEP IN SYNC
// ====================================================================================
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
  }) async {
    var cumSize = 0;
    for (final fileInfo in (await getAllOrdered()).reversed) {
      cumSize += await fileInfo.file.length();
      if (cumSize >= maxKeepSize) {
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

  Future<List<FileAndTimeInfo>> getRange({required DateTime startTime, required DateTime endTime}) async {
    final allFileInfos = await getAllOrdered();

    final startIndex = max(0, -1 + allFileInfos.lowerBoundBy(FileAndTimeInfo(fs.file(''), startTime), (e) => e.time));
    final endIndex = allFileInfos.lowerBoundBy(FileAndTimeInfo(fs.file(''), endTime), (e) => e.time);
    // print('hi getRange allFileInfos=$allFileInfos startIndex=$startIndex endIndex=$endIndex');

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
