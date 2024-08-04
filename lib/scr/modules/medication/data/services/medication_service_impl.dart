import 'package:uuid/uuid.dart';

import '../../../../shared/services/database/domain/enums/enums.dart';
import '../../../../shared/services/database/services/i_database_service.dart';
import '../../data/models/models.dart';
import '../../domain/services/i_medication_service.dart';

class MedicationServiceImp implements IMedicationService {
  final IDatabaseService _databaseService;

  MedicationServiceImp(this._databaseService);

  @override
  Future<List<MedicationEntity>> list() async {
    final docs = await _databaseService.getDocuments(documentsPath: DocumentsPathEnum.medication);
    return docs.map((data) => MedicationEntity.fromMap(data)).toList();
  }

  @override
  Future<MedicationEntity> get(String id) async {
    final data =
        await _databaseService.getDocumentById(documentsPath: DocumentsPathEnum.medication, id: id);
    if (data == null) {
      throw Exception('Medication not found');
    }
    return MedicationEntity.fromMap(data);
  }

  @override
  Future<MedicationEntity> create(MedicationEntity medication) async {
    final id = medication.id ?? _generateUniqueId(); // Gera um ID único se não fornecido

    await _databaseService.createDocument(
      documentsPath: DocumentsPathEnum.medication,
      data: medication.copyWith(id: id).toMap(),
    );

    return medication.copyWith(id: id);
  }

  @override
  Future<void> delete(String id) async {
    await _databaseService.deleteDocument(documentsPath: DocumentsPathEnum.medication, id: id);
  }

  String _generateUniqueId() {
    final uuid = const Uuid().v1();
    return uuid;
  }
}
