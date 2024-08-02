import 'package:equatable/equatable.dart';

import '../../domain/enum/enum.dart';
import '../../domain/models/models.dart';

class MedicationEntity extends Equatable {
  final int? id;
  final String name;
  final String dosage;
  final String duration;
  final DateTime startDate;
  final DateTime? endDate;
  final String status;
  final FrequencyEnum frequency;

  const MedicationEntity({
     this.id,
    required this.name,
    required this.dosage,
    required this.duration,
    required this.startDate,
    this.endDate,
    required this.status,
    required this.frequency,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        dosage,
        duration,
        startDate,
        endDate,
        status,
        frequency,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dosage': dosage,
      'duration': duration,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'status': status,
      'frequency': frequency.value,
    };
  }

  factory MedicationEntity.fromMap(Map<String, dynamic> map) {
    return MedicationEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      dosage: map['dosage'] as String,
      duration: map['duration'] as String,
      startDate: DateTime.parse(map['startDate'] as String),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate'] as String) : null,
      status: map['status'] as String,
      frequency: FrequencyEnum.fromInt(map['frequency'] as int),
    );
  }

  factory MedicationEntity.fromModel(MedicationModel model) {
    return MedicationEntity(
      id: model.id,
      name: model.name,
      dosage: model.dosage,
      duration: model.duration,
      startDate: model.startDate,
      endDate: model.endDate,
      status: model.status,
      frequency: model.frequency,
    );
  }
}
