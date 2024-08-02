import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../services/database/services/database_service_impl.dart';
import '../services/database/services/i_database_service.dart';

part 'get_it_extension.dart';

/// Abstract class for dependency injection using the GetIt package.
abstract class Injector {
  static final _getIt = GetIt.instance;

  /// Resolve and retrieve an instance of the specified type [T].
  ///
  /// Use this method to obtain instances of services and dependencies.
  static T resolve<T extends Object>({
    String? instanceName,
  }) =>
      _getIt.get<T>(instanceName: instanceName);

  /// Ensure that all registered dependencies are ready.
  ///
  /// This method can be used to await the initialization of all dependencies.
  static Future<void> allReady() => _getIt.allReady();

  /// Register service dependencies.
  ///
  /// This private method registers various service implementations with GetIt.
  static void _registerServices() {
    _getIt.registerDatabaseService();
  }

  /// Register all dependencies.
  ///
  /// Call this method to register all dependencies, including services and other dependencies.
  static void registerDependencies() {
    /// Services
    _registerServices();
  }
}
