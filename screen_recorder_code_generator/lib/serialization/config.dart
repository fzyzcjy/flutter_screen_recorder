class Config {
  final String className;
  final List<ConfigField> fields;

  Config({
    required this.className,
    required this.fields,
  });
}

class ConfigField {
  final String type;
  final String name;

  ConfigField({
    required this.type,
    required this.name,
  });
}
