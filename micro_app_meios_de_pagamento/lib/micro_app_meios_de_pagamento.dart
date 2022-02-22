import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'meios_de_pagamento_page.dart';

class MicroAppMeiosDePagamento extends MicroApp {
  @override
  String get microAppName => 'Meios de Pagamento';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/meiosDePagamento': (_, args) => const FitVloggerPage(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: microAppName,
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: '/meiosDePagamento',
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}
