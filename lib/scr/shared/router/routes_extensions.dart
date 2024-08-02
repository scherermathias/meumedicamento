import '../errors/not_found_error.dart';

extension RoutesExtensions on String {
  String replaceId({
    String idKey = 'id',
    required String id,
  }) {
    if (!contains(idKey)) {
      throw NotFoundError(message: 'Not found id key');
    }

    return replaceAll(':$idKey', id);
  }
}
