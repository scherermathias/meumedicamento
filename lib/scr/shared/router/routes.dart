import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../modules/medication/ui/cubits/cubits.dart';
import '../../modules/medication/ui/stores/stores.dart';
import '../../modules/medication/ui/views/views.dart';
import '../dependency_injection/injector.dart';

final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

abstract class Routes {
  static final GoRouter config = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: medication,
    routes: _routes,
    debugLogDiagnostics: kDebugMode,
  );

  static String get medication => '/list_medication';

  static List<RouteBase> get _routes => [
        GoRoute(
          name: 'medication',
          path: medication,
          builder: (context, state) => MultiProvider(
            providers: [
              BlocProvider(
                create: (context) => MedicationCubit(databaseService: Injector.resolve()),
              ),
              ChangeNotifierProvider(
                create: (context) => MedicationStore(
                  cubit: context.read(),
                ),
              ),
            ],
            child: const MedicationView(),
          ),
        ),
      ];
}
