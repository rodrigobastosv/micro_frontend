import 'package:core/core/di/app_injector.dart';
import 'package:event_bus/event_bus.dart';
import 'package:logger/logger.dart';

late Logger logger;
late AppInjector I;
late EventBus eventBus;

Future<void> initCore() async {
  logger = Logger();
  I = AppInjector();
  eventBus = EventBus();
}
