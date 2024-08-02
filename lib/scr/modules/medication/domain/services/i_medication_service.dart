import '../../data/models/models.dart';

abstract class IMedicationService {
  Future<List<MedicationEntity>> list();
  Future<MedicationEntity> get(String id);
  Future<MedicationEntity> create(MedicationEntity medication);
  Future<void> delete(String id);
}
