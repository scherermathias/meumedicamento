import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meumedicamento/scr/shared/services/database/services/i_database_service.dart';
import 'package:mocktail/mocktail.dart';

class MockDatabase extends Mock implements IDatabaseService {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockQuerySnapshot extends Mock implements QuerySnapshot<Map<String, dynamic>> {}

class MockDatabaseService extends Mock implements IDatabaseService {}

//Usar fake_cloud_firestore para testes reais

// ignore: subtype_of_sealed_class
class MockCollectionReference extends Mock implements CollectionReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
// ignore: subtype_of_sealed_class
class MockDocumentReference extends Mock implements DocumentReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {}
