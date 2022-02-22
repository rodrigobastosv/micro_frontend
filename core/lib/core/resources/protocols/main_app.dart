import '../../../core.dart';

abstract class MainApp extends BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  Future<void> registerRoutes() async {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    for (final microapp in microApps) {
      routes.addAll(microapp.routes);
    }
  }

  Future<void> initAppDependencies() async {}

  Future<void> initDependencies() async {
    await initAppDependencies();
    for (final microapp in microApps) {
      await microapp.initDependencies();
    }
  }

  Future<void> registerAppListeners() async {
    await registerEventListeners();
    for (final microapp in microApps) {
      await microapp.registerEventListeners();
    }
  }
}
