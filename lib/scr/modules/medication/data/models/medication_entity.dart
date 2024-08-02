import 'package:equatable/equatable.dart';

import '../../domain/enum/enum.dart';
import '../../domain/models/models.dart';

class MedicationEntity extends Equatable {
  final String? id;
  final String name;
  final String dosage;
  final DateTime dateTime;
  final MedicationStatusEnum status;

  const MedicationEntity({
    this.id,
    required this.name,
    required this.dosage,
    required this.dateTime,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        dosage,
        dateTime,
        status,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dosage': dosage,
      'dateTime': dateTime.toIso8601String(),
      'status': status.value,
    };
  }

  factory MedicationEntity.fromMap(Map<String, dynamic> map) {
    return MedicationEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      dosage: map['dosage'] as String,
      dateTime: DateTime.parse(map['dateTime'] as String),
      status: MedicationStatusEnum.fromInt(map['status'] as int),
    );
  }

  factory MedicationEntity.fromModel(MedicationModel model) {
    return MedicationEntity(
      id: model.id,
      name: model.name,
      dosage: model.dosage,
      dateTime: model.dateTime,
      status: model.status,
    );
  }

  MedicationEntity copyWith({
    String? id,
    String? name,
    String? dosage,
    DateTime? dateTime,
    MedicationStatusEnum? status,
  }) {
    return MedicationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
    );
  }
}
