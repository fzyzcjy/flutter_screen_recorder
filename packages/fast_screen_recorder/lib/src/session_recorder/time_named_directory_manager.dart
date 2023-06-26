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
  }) async {
    final rawFileNames = (await get().toList()).map((e) => basename(e.path)).toList();
    final sortedFileNames = rawFileNames.sortedBy<num>((e) =>
    -(_fileNamer
        .tryParse(e)
        ?.microsecondsSinceEpoch ?? 0));

    var cumSize = 0;
    for (final filename in sortedFileNames) {
      final file = fs.file('$directory/$filename');
      cumSize += await file.length();
      if (cumSize >= maxKeepSize) {
        await file.delete();
      }
    }
  }

  Stream<File> get({DateTime? startTime, DateTime? endTime}) {
    return fs
        .directory(directory)
        .list() //
        .where((e) => e is File)
        .map((e) => e as File)
        .where((path) {
      final time = _fileNamer.tryParse(basename(path.path));
      return time != null &&
          (startTime == null || time.isAfter(startTime)) &&
          (endTime == null || time.isBefore(endTime));
    });
  }
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
