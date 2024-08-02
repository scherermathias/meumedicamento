import 'package:flutter/material.dart';

import '../../data/models/models.dart';
import '../../domain/enum/enum.dart';
import '../cubits/cubits.dart';

class MedicationStore extends ChangeNotifier {
  final MedicationCubit cubit;
  MedicationStore({required this.cubit});

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dosageController = TextEditingController();


  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? value) {
    _dateTime = value;
    notifyListeners();
  }


  bool _validate() {
    if (formKey.currentState?.validate() != true) return false;
    if (_dateTime == null) return false;

    return true;
  }

  Future<void> save() async {
    final isValid = _validate();

    if (!isValid) return;

    final input = MedicationEntity(
      name: nameController.text,
      dosage: dosageController.text,
      dateTime: _dateTime!,
      status: MedicationStatusEnum.active,
    );

    await cubit.createMedication(medication: input);
  }

  void clear() {
    nameController.clear();
    dosageController.clear();
    dateTime = null;
  }
}
