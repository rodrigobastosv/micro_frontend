import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'conta_digital_page.dart';

class MicroAppContaDigital extends MicroApp {
  @override
  String get microAppName => 'Conta Digital';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/contaDigital': (_, args) => const ContaDigitalPage(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: microAppName,
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: '/contaDigital',
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}
