import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'scr/app.dart';
import 'scr/shared/dependency_injection/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  /// Register dependencies's
  Injector.registerDependencies();
  await Injector.allReady();

  /// Configure Intl.
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting('pt_BR');

  /// Lock app orientation in portrait mode.
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// Remove status bar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const App());
}
