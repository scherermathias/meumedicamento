import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

abstract class Routes {
  static final GoRouter config = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: home,
    routes: _routes,
    debugLogDiagnostics: kDebugMode,
  );

  static String get home => '/home';

  static List<RouteBase> get _routes => [];
}
