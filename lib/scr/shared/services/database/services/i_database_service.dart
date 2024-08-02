import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/enums/documents_path_enum.dart';

abstract class IDatabaseService {
  Future<Map<String, dynamic>?> getDocumentById({
    required DocumentsPathEnum documentsPath,
    required String id,
  });

  Future<List<Map<String, dynamic>>> getDocumentsByField({
    required DocumentsPathEnum documentsPath,
    required String field,
    required dynamic value,
  });

  Future<void> deleteDocument({
    required DocumentsPathEnum documentsPath,
    required String id,
  });

  Future<void> updateDocument({
    required DocumentsPathEnum documentsPath,
    required Map<String, dynamic> data,
    required String id,
  });

  Future<DocumentReference<Map<String, dynamic>>> createDocument({
    required DocumentsPathEnum documentsPath,
    required Map<String, dynamic> data,
  });
}
