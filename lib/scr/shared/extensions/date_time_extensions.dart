import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format([String format = 'dd/MM/yyyy']) {
    final formatter = DateFormat(format);

    return formatter.format(this);
  }

  String formatDateAndTime([String format = 'dd/MM/yyyy HH:mm']){
    final formatter = DateFormat(format);

    return formatter.format(this);
  }

  String formatHour([String format = 'HH:mm']) {
    final formatter = DateFormat(format);

    return formatter.format(this);
  }

  String formatHourSecond([String format = 'HH:mm:ss']) {
    final formatter = DateFormat(format);

    return formatter.format(this);
  }
}
