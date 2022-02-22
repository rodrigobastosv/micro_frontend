import 'package:components/styles/styles.dart';
import 'package:core/core.dart';
import 'package:core/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:micro_app_conta_digital/micro_app_conta_digital.dart';
import 'package:micro_app_fit_vlogger/micro_app_fit_vlogger.dart';
import 'package:micro_app_marketplace/micro_app_marketplace.dart';
import 'package:micro_app_meios_de_pagamento/micro_app_meios_de_pagamento.dart';

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
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nímia App',
                      style: NimiaFonts.descriptionBold.copyWith(fontSize: 30),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => dispatch(
                        Event(name: 'navigateContaDigital'),
                      ),
                      child: Text('Conta Digital'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => dispatch(
                        Event(name: 'navigateFitVlogger'),
                      ),
                      child: Text('Fit Vlogger'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => dispatch(
                        Event(name: 'navigateMarketplace'),
                      ),
                      child: Text('Marketplace'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => dispatch(
                        Event(name: 'navigateMeiosDePagamento'),
                      ),
                      child: Text('Meios de Pagamento'),
                    ),
                  ],
                ),
              ),
            ),
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
        MicroAppContaDigital(),
        MicroAppFitVlogger(),
        MicroAppMarketplace(),
        MicroAppMeiosDePagamento(),
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
      final eventName = event.name;

      if (eventName == 'navigateContaDigital') {
        handleNavigateContaDigitalEvent(event);
      } else if (eventName == 'navigateFitVlogger') {
        handleNavigateFitVlogger(event);
      } else if (eventName == 'navigateMarketplace') {
        handleNavigateMarketplace(event);
      } else if (eventName == 'navigateMeiosDePagamento') {
        handleNavigateMeiosDePagamento(event);
      }
    });
  }
}
