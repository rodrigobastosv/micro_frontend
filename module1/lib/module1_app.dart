import 'package:core/core.dart';
import 'package:core/core/dependencies/flutter_dependencies.dart';
import 'package:module1/module1_page.dart';

class Module1App extends MicroApp {
  @override
  String get microAppName => 'module1';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/module1': (BuildContext _, args) => const Module1Page(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: microAppName,
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: '/module1',
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}
