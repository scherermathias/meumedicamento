part of 'injector.dart';

extension GetItExtension on GetIt {
  GetIt registerDatabaseService() {
    return this
      ..registerSingleton<IDatabaseService>(
        DatabaseServiceImpl(FirebaseFirestore.instance),
      );
  }
}
