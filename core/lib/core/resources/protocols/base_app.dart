import '../../../core.dart';
import '../../dependencies/flutter_dependencies.dart';

abstract class BaseApp extends StatelessWidget {
  final Map<String, WidgetBuilderArgs> routes = {};

  Future<void> initDependencies();

  Future<void> registerEventListeners();

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final Uri currentUri = Uri.parse(settings.name!);
    final String uriPath = currentUri.path;
    final route = routes[uriPath];

    final Arguments routerArgs = settings.arguments != null
        ? (settings.arguments! as Arguments)
        : Arguments(uri: currentUri, params: currentUri.queryParameters);

    if (route != null) {
      final path = routerArgs.uri?.toString() ?? uriPath;
      return generateFadeRoute(route, path, routerArgs);
    }

    return _generateDynamicRoute(currentUri, routerArgs);
  }

  Route<dynamic>? _generateDynamicRoute(Uri calledUri, Arguments args) {
    Route<dynamic>? dynamicRoute;

    routes.forEach(
      (namedRoute, builder) {
        final routingData = parseUrlParams(namedRoute, calledUri);
        if (routingData != null) {
          final Map<String, dynamic> combinedArgs = {};
          combinedArgs.addAll(routingData.params);
          combinedArgs.addAll(args.params);

          dynamicRoute = generateFadeRoute(
            builder,
            Uri(path: calledUri.path, queryParameters: args.params).toString(),
            Arguments(params: combinedArgs, uri: routingData.uri),
          );
          return;
        }
      },
    );

    return dynamicRoute;
  }
}
