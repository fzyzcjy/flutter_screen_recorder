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

  group('prune', () {
    void _prepare() {
      fs.file(manager.getPathForTime(DateTime(2000))).writeAsStringSync('a' * 1000);
      fs.file(manager.getPathForTime(DateTime(2001))).writeAsStringSync('b' * 1000);
      fs.file(manager.getPathForTime(DateTime(2002))).writeAsStringSync('c' * 1000);
    }

    test('when maxKeepSize big enough, should prune nothing', () async {
      _prepare();
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
      _prepare();
      await manager.prune(maxKeepSize: 999);
      expect(
        fs.directory(directory).listSync(),
        [],
      );
    });

    test('when maxKeepSize median, should prune oldest content', () async {
      _prepare();
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
    test('simple', () {
      TODO;
    });
  });
}
