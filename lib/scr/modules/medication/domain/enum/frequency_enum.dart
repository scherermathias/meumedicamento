enum FrequencyEnum {
  onceADay(1, 'Uma vez ao dia'),
  twiceADay(2, 'Duas vezes ao dia'),
  threeTimesADay(3, 'Três vezes ao dia');

  final String description;
  final int value;

  const FrequencyEnum(this.value, this.description);

  factory FrequencyEnum.fromInt(int value) =>
      FrequencyEnum.values.singleWhere((x) => x.value == value);

  factory FrequencyEnum.fromString(String description) =>
      FrequencyEnum.values.singleWhere((x) => x.name.toLowerCase() == description.toLowerCase());
}
