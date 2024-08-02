enum MedicationStatusEnum {
  active(0, 'Ativo'),
  used(1, 'Usado');

  final String description;
  final int value;

  const MedicationStatusEnum(this.value, this.description);

  factory MedicationStatusEnum.fromInt(int value) =>
      MedicationStatusEnum.values.singleWhere((x) => x.value == value);

  factory MedicationStatusEnum.fromString(String description) => MedicationStatusEnum.values
      .singleWhere((x) => x.name.toLowerCase() == description.toLowerCase());
}
