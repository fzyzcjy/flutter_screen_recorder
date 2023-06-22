class TypeInfo {
  final bool isEnum;

  const TypeInfo({
    this.isEnum = false,
  });
}

const kTypeInfos = {
  'BlendMode': TypeInfo(isEnum: true),
  'Clip': TypeInfo(isEnum: true),
  'FilterQuality': TypeInfo(isEnum: true),
  // TODO more
};

TypeInfo getTypeInfo(String name) => kTypeInfos[name.replaceAll('?', '')] ?? const TypeInfo();
