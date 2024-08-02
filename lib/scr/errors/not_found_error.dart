import 'generic_error.dart';

final class NotFoundError extends GenericError {
  NotFoundError({
    super.message = 'Not found.',
    super.error,
  });
}
