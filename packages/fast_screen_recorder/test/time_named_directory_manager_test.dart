void main() {
  const directory = '/hello-folder';
  late MemoryFileSystem fs;
  late TimeNamedDirectoryManager manager;
  setUp(() {
    fs = MemoryFileSystem();
    manager = TimeNamedDirectoryManager(
      fileSystem: fs,
      directory: directory,
      extension: 'bin',
    );
  });

  void _createSeveralFiles() {
    fs.file(manager.getPathForTime(DateTime(2000))).writeAsStringSync('a' * 1000);
    fs.file(manager.getPathForTime(DateTime(2001))).writeAsStringSync('b' * 1000);
    fs.file(manager.getPathForTime(DateTime(2002))).writeAsStringSync('c' * 1000);
  }

  group('prune', () {
    test('when maxKeepSize big enough, should prune nothing', () async {
      _createSeveralFiles();
      await manager.prune(maxKeepSize: 3001);
      expect(
        fs.directory(directory).listSync(),
        [
          manager.getPathForTime(DateTime(2000)),
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );
    });

    test('when maxKeepSize small enough, should prune everything', () async {
      _createSeveralFiles();
      await manager.prune(maxKeepSize: 999);
      expect(
        fs.directory(directory).listSync(),
        [],
      );
    });

    test('when maxKeepSize median, should prune oldest content', () async {
      _createSeveralFiles();
      await manager.prune(maxKeepSize: 2001);
      expect(
        fs.directory(directory).listSync(),
        [
          // oldest content is removed
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );
    });
  });

  group('get', () {
    test('when no arg, should get all', () {
      _createSeveralFiles();
      expect(
        manager.get(),
        [
          manager.getPathForTime(DateTime(2000)),
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );
    });

    test('when time at middle of a file, should include that file', () {
      _createSeveralFiles();

      expect(
        manager.get(
          startTime: DateTime(2000, 7, 1),
          endTime: DateTime(2002, 7, 1),
        ),
        [
          manager.getPathForTime(DateTime(2000)),
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );

      expect(
        manager.get(
          startTime: DateTime(2001, 7, 1),
          endTime: DateTime(2001, 7, 2),
        ),
        [
          manager.getPathForTime(DateTime(2001)),
        ],
      );
    });
  });
}
