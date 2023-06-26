import 'package:fast_screen_recorder/src/session_recorder/time_named_directory_manager.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const directory = '/hello-folder';
  late MemoryFileSystem fs;
  late TimeNamedDirectoryManager manager;
  setUp(() {
    fs = MemoryFileSystem();
    manager = TimeNamedDirectoryManager(
      fs: fs,
      directory: directory,
      extension: 'bin',
    );
  });

  void createSeveralFiles() {
    fs.directory(directory).createSync();
    fs.file(manager.getPathForTime(DateTime(2000))).writeAsStringSync('a' * 1000);
    fs.file(manager.getPathForTime(DateTime(2001))).writeAsStringSync('b' * 1000);
    fs.file(manager.getPathForTime(DateTime(2002))).writeAsStringSync('c' * 1000);
  }

  group('prune', () {
    test('when maxKeepSize big enough, should prune nothing', () async {
      createSeveralFiles();
      await manager.prune(maxKeepSize: 3001);
      expect(
        fs.directory(directory).listSync().toPathList(),
        [
          manager.getPathForTime(DateTime(2000)),
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );
    });

    test('when maxKeepSize small enough, should prune everything', () async {
      createSeveralFiles();
      await manager.prune(maxKeepSize: 999);
      expect(
        fs.directory(directory).listSync().toPathList(),
        [],
      );
    });

    test('when maxKeepSize median, should prune oldest content', () async {
      createSeveralFiles();
      await manager.prune(maxKeepSize: 2001);
      expect(
        fs.directory(directory).listSync().toPathList(),
        [
          // oldest content is removed
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );
    });
  });

  group('get', () {
    test('when no arg, should get all', () async {
      createSeveralFiles();
      expect(
        (await manager.get().toList()).toPathList(),
        [
          manager.getPathForTime(DateTime(2000)),
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );
    });

    test('when time at middle of a file, should include that file', () async {
      createSeveralFiles();

      expect(
        (await manager
                .get(
                  startTime: DateTime(2000, 7, 1),
                  endTime: DateTime(2002, 7, 1),
                )
                .toList())
            .toPathList(),
        [
          manager.getPathForTime(DateTime(2000)),
          manager.getPathForTime(DateTime(2001)),
          manager.getPathForTime(DateTime(2002)),
        ],
      );

      expect(
        (await manager
                .get(
                  startTime: DateTime(2001, 7, 1),
                  endTime: DateTime(2001, 7, 2),
                )
                .toList())
            .toPathList(),
        [
          manager.getPathForTime(DateTime(2001)),
        ],
      );
    });
  });
}

extension on List<FileSystemEntity> {
  List<String> toPathList() => map((e) => e.path).toList();
}
