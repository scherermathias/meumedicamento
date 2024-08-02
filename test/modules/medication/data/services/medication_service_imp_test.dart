import 'package:flutter_test/flutter_test.dart';
import 'package:meumedicamento/scr/modules/medication/data/models/models.dart';
import 'package:meumedicamento/scr/modules/medication/domain/enum/enum.dart';
import 'package:meumedicamento/scr/modules/medication/domain/services/i_medication_service.dart';
import 'package:mocktail/mocktail.dart';

class MockMedicationService extends Mock implements IMedicationService {}

void main() {
  late MockMedicationService mockMedicationService;
  late MedicationEntity testMedication;

  setUp(() {
    mockMedicationService = MockMedicationService();
    testMedication = MedicationEntity(
      id: 1,
      name: 'Test Medication',
      dosage: '50mg',
      dateTime: DateTime.parse('2024-01-01'),
      status: MedicationStatusEnum.active,
    );
  });

  group('IMedicationService', () {
    test('list should return a list of medications', () async {
      // Arrange
      when(() => mockMedicationService.list()).thenAnswer(
        (_) async => [testMedication],
      );

      // Act
      final result = await mockMedicationService.list();

      // Assert
      expect(result, [testMedication]);
      verify(() => mockMedicationService.list()).called(1);
    });

    test('list should throw an exception if listing fails', () async {
      // Arrange
      when(() => mockMedicationService.list()).thenThrow(
        Exception('Failed to fetch list'),
      );

      // Act & Assert
      expect(
        () async => await mockMedicationService.list(),
        throwsA(isA<Exception>()),
      );
    });

    test('get should return a single medication', () async {
      // Arrange
      when(() => mockMedicationService.get(any())).thenAnswer(
        (_) async => testMedication,
      );

      // Act
      final result = await mockMedicationService.get('1');

      // Assert
      expect(result, testMedication);
      verify(() => mockMedicationService.get('1')).called(1);
    });

    test('get should throw an exception if fetching fails', () async {
      // Arrange
      when(() => mockMedicationService.get(any())).thenThrow(
        Exception('Failed to fetch medication'),
      );

      // Act & Assert
      expect(
        () async => await mockMedicationService.get('1'),
        throwsA(isA<Exception>()),
      );
    });

    test('delete should successfully delete a medication', () async {
      // Arrange
      when(() => mockMedicationService.delete(any())).thenAnswer(
        (_) async => {},
      );

      // Act
      await mockMedicationService.delete('1');

      // Assert
      verify(() => mockMedicationService.delete('1')).called(1);
    });

    test('delete should throw an exception if deletion fails', () async {
      // Arrange
      when(() => mockMedicationService.delete(any())).thenThrow(
        Exception('Failed to delete medication'),
      );

      // Act & Assert
      expect(
        () async => await mockMedicationService.delete('1'),
        throwsA(isA<Exception>()),
      );
    });
  });
}