import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  DateTime? toDateTime([String format = 'dd/MM/yyyy']) {
    final formatter = DateFormat(format);

    try {
      return formatter.parse(this);
    } catch (e) {
      return null;
    }
  }

  TimeOfDay toTime() {
    final parts = split(':');

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }
}
