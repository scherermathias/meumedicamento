import 'package:flutter/material.dart';

import '../../domain/enum/enum.dart';
import '../cubits/cubits.dart';

class MedicationStore extends ChangeNotifier {
  final MedicationCubit cubit;
  MedicationStore({required this.cubit});

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dosageController = TextEditingController();

  Duration? _duration;
  Duration? get duration => _duration;
  set duration(Duration? value) {
    _duration = value;
    notifyListeners();
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
    notifyListeners();
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
    notifyListeners();
  }

  MedicationStatusEnum? _status;
  MedicationStatusEnum? get status => _status;
  set status(MedicationStatusEnum? value) {
    _status = value;
    notifyListeners();
  }

  FrequencyEnum? _frequency;
  FrequencyEnum? get frequency => _frequency;
  set frequency(FrequencyEnum? value) {
    _frequency = value;
    notifyListeners();
  }

  // void save() {
  //   if (formKey.currentState!.validate()) {
  //     cubit.save(
  //       name: nameController.text,
  //       dosage: dosageController.text,
  //       duration: duration!,
  //       startDate: startDate!,
  //       endDate: endDate,
  //       status: status!,
  //       frequency: frequency!,
  //     );
  //   }
  // }
}
