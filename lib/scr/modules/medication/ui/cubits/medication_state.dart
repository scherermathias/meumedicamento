import 'package:equatable/equatable.dart';

import '../../../../shared/errors/errors.dart';
import '../../data/models/models.dart';

sealed class MedicationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MedicationInitial extends MedicationState {}

class MedicationLoading extends MedicationState {}

class MedicationLoaded extends MedicationState {
  final List<MedicationEntity> medications;

  MedicationLoaded({required this.medications});

  @override
  List<Object?> get props => [medications];
}

class MedicationEmpty extends MedicationState {}

class MedicationDeleted extends MedicationState {}

class MedicationError extends MedicationState {
  final GenericError message;

  MedicationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class MedicationCreated extends MedicationState {}