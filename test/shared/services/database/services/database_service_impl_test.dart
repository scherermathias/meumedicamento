import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meumedicamento/scr/shared/services/database/domain/enums/documents_path_enum.dart';
import 'package:meumedicamento/scr/shared/services/database/services/database_service_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/mock_database_service.dart';

void main() {
  late DatabaseServiceImpl databaseService;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot();

    when(() => mockFirestore.collection(any())).thenReturn(mockCollectionReference);
    databaseService = DatabaseServiceImpl(mockFirestore);
  });

  group('DatabaseServiceImpl', () {
    test('deleteDocument should successfully delete a document', () async {
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.delete()).thenAnswer((_) async => {});

      await databaseService.deleteDocument(
        documentsPath: DocumentsPathEnum.medication,
        id: 'test-id',
      );

      verify(() => mockCollectionReference.doc('test-id')).called(1);
      verify(() => mockDocumentReference.delete()).called(1);
    });

    test('deleteDocument should throw an exception if deletion fails', () async {
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.delete())
          .thenThrow(FirebaseException(plugin: 'test', message: 'Failed'));

      expect(
        () async => await databaseService.deleteDocument(
          documentsPath: DocumentsPathEnum.medication,
          id: 'test-id',
        ),
        throwsA(isA<FirebaseException>()),
      );
    });

    test('getDocumentById should return a document data', () async {
      final documentData = {'key': 'value'};
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.data()).thenReturn(documentData);

      final result = await databaseService.getDocumentById(
        documentsPath: DocumentsPathEnum.medication,
        id: 'test-id',
      );

      expect(result, equals(documentData));
    });

    test('getDocumentById should return null if document does not exist', () async {
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.data()).thenReturn(null);

      final result = await databaseService.getDocumentById(
        documentsPath: DocumentsPathEnum.medication,
        id: 'test-id',
      );

      expect(result, isNull);
    });

    test('getDocumentById should throw an exception if fetching fails', () async {
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.get())
          .thenThrow(FirebaseException(plugin: 'test', message: 'Failed'));

      expect(
        () async => await databaseService.getDocumentById(
          documentsPath: DocumentsPathEnum.medication,
          id: 'test-id',
        ),
        throwsA(isA<FirebaseException>()),
      );
    });

    test('updateDocument should successfully update a document', () async {
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.update(any())).thenAnswer((_) async => {});

      await databaseService.updateDocument(
        documentsPath: DocumentsPathEnum.medication,
        data: {'key': 'value'},
        id: 'test-id',
      );

      verify(() => mockCollectionReference.doc('test-id')).called(1);
      verify(() => mockDocumentReference.update({'key': 'value'})).called(1);
    });

    test('updateDocument should throw an exception if updating fails', () async {
      when(() => mockCollectionReference.doc(any())).thenReturn(mockDocumentReference);
      when(() => mockDocumentReference.update(any()))
          .thenThrow(FirebaseException(plugin: 'test', message: 'Failed'));

      expect(
        () async => await databaseService.updateDocument(
          documentsPath: DocumentsPathEnum.medication,
          data: {'key': 'value'},
          id: 'test-id',
        ),
        throwsA(isA<FirebaseException>()),
      );
    });
  });
}
