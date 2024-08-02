import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../enum/enum.dart';

class MedicationModel extends Equatable {
  final int id;
  final String name;
  final String dosage;
  final Duration duration;
  final DateTime startDate;
  final DateTime? endDate;
  final MedicationStatusEnum status;
  final FrequencyEnum frequency;

  const MedicationModel({
    required this.id,
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
      'status': status.value,
      'frequency': frequency.value,
    };
  }

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
        id: map['id'] as int,
        name: map['name'] as String,
        dosage: map['dosage'] as String,
        duration: map['duration'] as Duration,
        startDate: DateTime.parse(map['startDate'] as String),
        endDate: map['endDate'] != null ? DateTime.parse(map['endDate'] as String) : null,
        status: MedicationStatusEnum.fromInt(map['status'] as int),
        frequency: FrequencyEnum.fromInt(map['frequency'] as int));
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) =>
      MedicationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
