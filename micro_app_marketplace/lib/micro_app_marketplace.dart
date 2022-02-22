import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'marketplace_page.dart';

class MicroAppMarketplace extends MicroApp {
  @override
  String get microAppName => 'Marketplace';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/marketplace': (_, args) => const FitVloggerPage(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: microAppName,
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: '/marketplace',
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}
