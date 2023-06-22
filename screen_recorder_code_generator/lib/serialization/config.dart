class Config {
  final String className;
  final String? constructorName;
  final String? constructorParams;
  final List<ConfigField> fields;

  Config({
    required this.className,
    this.constructorName,
    this.constructorParams,
    required this.fields,
  });

  List<ConfigField> get namedFields => fields.where((e) => e.named).toList();

  List<ConfigField> get nonNamedFields => fields.where((e) => !e.named).toList();
}

class ConfigField {
  final String type;
  final String name;
  final bool named;

  ConfigField({
    required this.type,
    required this.name,
    required this.named,
  });
}
