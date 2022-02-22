abstract class BaseInjector {
  T getDependency<T extends Object>();
  Future<void> registerDependency<T extends Object>(T dependency);
}
