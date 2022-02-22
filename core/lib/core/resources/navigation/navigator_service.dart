import 'package:core/core/dependencies/flutter_dependencies.dart';

import '../../../core.dart';

class NavigatorService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigatorState => navigatorKey.currentState!;

  static Future<dynamic> push(
    String routeName, {
    Map<String, dynamic>? queryParams,
    dynamic data,
  }) {
    Uri uri = Uri(path: routeName);

    if (queryParams != null) {
      uri = Uri(path: routeName, queryParameters: queryParams);
    }

    return navigatorState.pushNamed(
      routeName,
      arguments: const Arguments().copyWith(
        params: queryParams,
        uri: uri,
        data: data,
      ),
    );
  }

  static void pop() {
    if (navigatorState.canPop()) {
      navigatorKey.currentState!.pop();
    } else {
      push('/');
    }
  }
}
