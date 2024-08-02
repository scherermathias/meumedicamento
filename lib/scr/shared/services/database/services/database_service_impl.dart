import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meumedicamento/scr/shared/services/database/domain/enums/documents_path_enum.dart';
import 'package:meumedicamento/scr/shared/services/database/services/i_database_service.dart';

class DatabaseServiceImpl implements IDatabaseService {
  final FirebaseFirestore _firestore;

  DatabaseServiceImpl(this._firestore);

  @override
  Future<DocumentReference<Map<String, dynamic>>> createDocument({
    required DocumentsPathEnum documentsPath,
    required Map<String, dynamic> data,
  }) async {
    try {
      final result = await _firestore.collection(documentsPath.path).add(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteDocument({
    required DocumentsPathEnum documentsPath,
    required String id,
  }) async {
    try {
      await _firestore.collection(documentsPath.path).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> getDocumentById({
    required DocumentsPathEnum documentsPath,
    required String id,
  }) async {
    try {
      final result = await _firestore.collection(documentsPath.path).doc(id).get();
      return result.data();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getDocumentsByField({
    required DocumentsPathEnum documentsPath,
    required String field,
    required value,
  }) async {
    try {
      final result =
          await _firestore.collection(documentsPath.path).where(field, isEqualTo: value).get();
      return result.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateDocument({
    required DocumentsPathEnum documentsPath,
    required Map<String, dynamic> data,
    required String id,
  }) async {
    try {
      await _firestore.collection(documentsPath.path).doc(id).update(data);
    } catch (e) {
      rethrow;
    }
  }
}
