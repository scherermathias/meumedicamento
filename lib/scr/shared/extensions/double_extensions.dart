import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String format(String format) {
    final formatter = NumberFormat(format);

    return formatter.format(this);
  }

  String formatHour() {
    return format('00.00').replaceAll(',', ':');
  }

  double useDecimalPlaces(int places) {
    return double.parse(toStringAsFixed(places));
  }
}
