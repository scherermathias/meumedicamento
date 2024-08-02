import 'generic_error.dart';

final class InvalidRouteParamsError extends GenericError {
  InvalidRouteParamsError({
    super.message = 'Parâmetro da rota é inválido.',
    super.error,
  });
}
