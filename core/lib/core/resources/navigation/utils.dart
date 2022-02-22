import 'package:flutter/widgets.dart';

import '../../../core.dart';

class RoutingData {
  RoutingData(this.uri, this.params);

  final Uri uri;
  final Map<String, dynamic> params;
}

Route<dynamic> generateFadeRoute(
  WidgetBuilderArgs builder,
  String path,
  Arguments? args,
) {
  return FadeRoute(child: builder, path: path, routerArgs: args);
}

String prepareToRegex(String url) {
  final newUrl = <String>[];
  for (final part in url.split('/')) {
    final url = part.contains(':') ? '(.*?)' : part;
    newUrl.add(url);
  }

  return newUrl.join('/');
}

RoutingData? parseUrlParams(String routeNamed, Uri uri) {
  if (routeNamed.contains('/:')) {
    final regExp = RegExp('^${prepareToRegex(routeNamed)}\$');

    final routeMatch = regExp.firstMatch(uri.path);
    return routeMatch != null ? _createRoutingData(routeNamed, uri) : null;
  }

  return null;
}

RoutingData _createRoutingData(String routeNamed, Uri uri) {
  final Map<String, String> params = {};
  final routeParts = routeNamed.split('/');
  final pathParts = uri.path.split('/');
  int paramPos = 0;

  String newRouteNamed = routeNamed;

  for (final routePart in routeParts) {
    if (routePart.contains(':')) {
      final paramName = routePart.replaceFirst(':', '');
      if (pathParts[paramPos].isNotEmpty) {
        params[paramName] = pathParts[paramPos];
        newRouteNamed = routeNamed.replaceFirst(routePart, params[paramName]!);
      }
    }
    paramPos++;
  }

  return RoutingData(uri.replace(path: newRouteNamed), params);
}
