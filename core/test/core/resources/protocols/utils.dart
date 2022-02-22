import 'package:core/core.dart';
import 'package:core/core/dependencies/flutter_dependencies.dart';

class TestApp extends MainApp {
  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {
        '/base': (context, args) => Container(),
      };

  @override
  List<MicroApp> get microApps => [
        TestMicroApp(),
      ];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }

  @override
  Future<void> registerEventListeners() async {}
}

class TestMicroApp extends MicroApp {
  @override
  String get microAppName => 'test-micro-app';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/base-micro': (context, args) => Container(),
        '/base-micro/:id': (context, args) => Container(),
      };

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}

Route<dynamic>? generateRouteFromUrl(
  BaseApp testApp, {
  required String url,
  Arguments? arguments,
}) =>
    testApp.generateRoute(RouteSettings(name: url, arguments: arguments));
