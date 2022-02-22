import '../../../../core.dart';
import '../../../dependencies/flutter_dependencies.dart';

class FadeRoute extends PageRouteBuilder {
  FadeRoute({
    required this.child,
    this.routerArgs,
    required this.path,
  }) : super(
          settings: RouteSettings(
            name: path,
            arguments: routerArgs,
          ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child.call(context, routerArgs),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
  final WidgetBuilderArgs child;
  final Arguments? routerArgs;
  final String path;
}
