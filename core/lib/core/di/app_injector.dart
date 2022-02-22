import 'package:core/core/di/base_injector.dart';
import 'package:get_it/get_it.dart';

class AppInjector implements BaseInjector {
  final getIt = GetIt.instance;

  @override
  T getDependency<T extends Object>() {
    return getIt.get<T>();
  }

  @override
  Future<void> registerDependency<T extends Object>(T dependency) async {
    getIt.registerLazySingleton<T>(() => dependency);
  }
}
