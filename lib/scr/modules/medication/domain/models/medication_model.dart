import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../enum/enum.dart';

class MedicationModel extends Equatable {
  final String id;
  final String name;
  final String dosage;
  final DateTime dateTime;
  final MedicationStatusEnum status;

  const MedicationModel({
    required this.id,
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
        status,
        dateTime,
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

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
        id: map['id'] as String,
        name: map['name'] as String,
        dosage: map['dosage'] as String,
        dateTime: DateTime.parse(map['dateTime'] as String),
        status: MedicationStatusEnum.fromInt(map['status'] as int));
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) =>
      MedicationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
