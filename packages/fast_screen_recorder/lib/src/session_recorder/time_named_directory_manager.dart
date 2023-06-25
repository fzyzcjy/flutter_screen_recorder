class TimeNamedDirectoryManager {
  final _FileNamer _fileNamer;

  TimeNamedDirectoryManager({
    required String extension,
  }) : _fileNamer = _FileNamer(suffix: '.$extension');

  Future<void> prune({
    required int maxKeepSize,
  }) async {
    final rawFileNames = (await getRecords().toList()).map((e) => basename(e.path)).toList();
    final sortedFileNames = rawFileNames.sortedBy<num>((e) => -(_FileNamer.tryParse(e)?.microsecondsSinceEpoch ?? 0));

    var cumSize = 0;
    for (final filename in sortedFileNames) {
      final file = File('$directory/$filename');
      cumSize += await file.length();
      if (cumSize >= maxKeepSize) {
        await file.delete();
      }
    }
  }

  Stream<File> get({DateTime? startTime, DateTime? endTime}) {
    return directory
        .list() //
        .where((e) => e is File)
        .map((e) => e as File)
        .where((path) {
      final time = _FileNamer.tryParse(basename(path.path));
      return time != null &&
          (startTime == null || time.isAfter(startTime)) &&
          (endTime == null || time.isBefore(endTime));
    });
  }
}

class _FileNamer {
  final String suffix;

  const _FileNamer({required this.suffix});

  static String create(DateTime time) {
    return time.microsecondsSinceEpoch.toString() + _kSuffix;
  }

  // need to "try", since if somehow the folder is corrupted with weird files, it should not crash
  static DateTime? tryParse(String name) {
    final timeString = name.stripSuffix(_kSuffix);
    if (timeString == null) return null;

    final timeInt = int.tryParse(timeString);
    if (timeInt == null) return null;

    return DateTime.fromMicrosecondsSinceEpoch(timeInt);
  }
}
