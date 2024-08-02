enum DocumentsPathEnum {
  medication('/medication'),
  ;

  final String path;

  const DocumentsPathEnum(
    this.path,
  );

  factory DocumentsPathEnum.fromInt(int value) =>
      DocumentsPathEnum.values.singleWhere((x) => x.index == value);

  factory DocumentsPathEnum.fromString(String path) =>
      DocumentsPathEnum.values.singleWhere((x) => x.path.toLowerCase() == path.toLowerCase());
}
