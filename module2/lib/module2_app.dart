import 'package:core/core.dart';
import 'package:core/core/dependencies/flutter_dependencies.dart';
import 'package:module2/module2_page.dart';

class Module2App extends MicroApp {
  @override
  String get microAppName => 'module2';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/module2': (BuildContext _, args) => const Module2Page(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: microAppName,
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: '/module2',
    );
  }

  @override
  Future<void> initDependencies() async {}

  @override
  Future<void> registerEventListeners() async {}
}
