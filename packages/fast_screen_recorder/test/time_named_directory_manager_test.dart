void main() {
  late MemoryFileSystem fileSystem;
  late TimeNamedDirectoryManager manager;
  setUp(() {
    fileSystem = MemoryFileSystem();
    manager = TimeNamedDirectoryManager(
      fileSystem: fileSystem,
      extension: 'bin',
    );
  });

  TODO;
}
