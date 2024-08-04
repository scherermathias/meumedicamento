import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/errors/errors.dart';
import '../../data/models/models.dart';
import '../../domain/services/i_medication_service.dart';
import 'medication_state.dart';

class MedicationCubit extends Cubit<MedicationState> {
  final IMedicationService _medicationService;

  MedicationCubit({required IMedicationService medicationService})
      : _medicationService = medicationService,
        super(MedicationInitial());

  Future<void> getMedications() async {
    emit(MedicationLoading());
    try {
      final medications = await _medicationService.list();
      if (medications.isEmpty) {
        emit(MedicationEmpty());
      } else {
        emit(MedicationLoaded(medications: medications));
      }
    } catch (e) {
      emit(MedicationError(message: GenericError(message: e.toString())));
    }
  }

  Future<void> deleteMedication({required String id}) async {
    emit(MedicationLoading());
    try {
      await _medicationService.delete(id);
      emit(MedicationDeleted());
    } catch (e) {
      emit(MedicationError(message: GenericError(message: e.toString())));
    }
  }

  Future<void> createMedication({required MedicationEntity medication}) async {
    emit(MedicationLoading());
    try {
      await _medicationService.create(medication);
      emit(MedicationCreated());
    } catch (e) {
      emit(MedicationError(message: GenericError(message: e.toString())));
    }
  }
}
