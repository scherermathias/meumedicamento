import 'package:flutter/material.dart';

import '../cubits/cubits.dart';

class MedicationStore extends ChangeNotifier{
  final MedicationCubit cubit;
  MedicationStore({required this.cubit});
}