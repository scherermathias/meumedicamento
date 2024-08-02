import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/errors/errors.dart';
import '../../../../shared/services/database/domain/enums/documents_path_enum.dart';
import '../../../../shared/services/database/services/i_database_service.dart';
import '../../data/models/medication_entity.dart';
import 'medication_state.dart';

class MedicationCubit extends Cubit<MedicationState> {
  final IDatabaseService databaseService;

  MedicationCubit({required this.databaseService}) : super(MedicationInitial());

  Future<void> getMedications() async {
    emit(MedicationLoading());
    try {
      final docsResponse =
          await databaseService.getDocuments(documentsPath: DocumentsPathEnum.medication);
      if (docsResponse.isEmpty) {
        emit(MedicationEmpty());
      } else {
        final medications =
            docsResponse.map((medication) => MedicationEntity.fromMap(medication)).toList();
        emit(MedicationLoaded(medications: medications));
      }
    } catch (e) {
      emit(MedicationError(message: GenericError(message: e.toString())));
    }
  }

  Future<void> deleteMedication({required String id}) async {
    emit(MedicationLoading());
    try {
      await databaseService.deleteDocument(documentsPath: DocumentsPathEnum.medication, id: id);
      emit(MedicationDeleted());
    } catch (e) {
      emit(MedicationError(message: GenericError(message: e.toString())));
    }
  }

  Future<void> createMedication({required MedicationEntity medication}) async {
    emit(MedicationLoading());
    try {
      await databaseService
          .createDocument(
        documentsPath: DocumentsPathEnum.medication,
        data: medication.toMap(),
      )
          .then((result) async {
        medication = medication.copyWith(id: result.id);

        await databaseService.updateDocument(
          documentsPath: DocumentsPathEnum.medication,
          data: medication.toMap(),
          id: result.id,
        );

        emit(MedicationCreated());
      });
    } catch (e) {
      emit(MedicationError(message: GenericError(message: e.toString())));
    }
  }
}
