import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'fit_vlogger_page.dart';

class MicroAppFitVlogger extends MicroApp {
  @override
  String get microAppName => 'Fit Vlogger';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/fitVlogger': (_, args) => const FitVloggerPage(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: microAppName,
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: '/fitVlogger',
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}
