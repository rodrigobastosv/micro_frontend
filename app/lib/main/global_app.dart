import 'package:core/core.dart';
import 'package:core/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:module1/module1_app.dart';
import 'package:module2/module2_app.dart';

import '../events/events.dart';
import '../theme/nimia_theme.dart';

class GlobalApp extends MainApp {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Future.wait([
        super.registerRoutes(),
        super.registerAppListeners(),
        initAppDependencies(),
        initDependencies(),
      ]),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nímia App',
            theme: nimiaTheme,
            navigatorKey: NavigatorService.navigatorKey,
            onGenerateRoute: super.generateRoute,
            initialRoute: '/module1',
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        Module1App(),
        Module2App(),
      ];

  @override
  Future<void> initAppDependencies() async {
    await I.registerDependency<LocalStorageService>(
      SharedPrefsLocalStorageService()..init(),
    );
    return super.initAppDependencies();
  }

  @override
  Future<void> registerEventListeners() async {
    listen((event) {
      if (event.name == 'NextPage') handleNextPageEvent(event);
    });
  }
}
