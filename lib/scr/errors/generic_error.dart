import 'package:equatable/equatable.dart';

base class GenericError extends Equatable implements Exception {
  /// Description of the error created.
  ///
  /// This message can be used to provide detailed information
  /// about the error to the end user or for debugging purposes.
  final String message;

  /// Created error details.
  ///
  /// This property can be used to access specific details about the error,
  /// such as a stack trace or error code, and can be used for debugging or
  /// to present detailed information to the end user.
  final dynamic error;

  GenericError({
    String? message,
    this.error,
  }) : message = message ?? 'Ocorreu um erro não tratado: ${error.toString()}';

  @override
  String toString() => message;

  @override
  List<Object?> get props => [
        message,
        error,
      ];
}
