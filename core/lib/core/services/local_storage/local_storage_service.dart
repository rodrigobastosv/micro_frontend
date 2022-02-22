abstract class LocalStorageService {
  Future<void> init();

  bool? getBool({
    required String key,
  });

  int? getInt({
    required String key,
  });

  String? getString({
    required String key,
  });

  Future<void> setBool(
    String key, {
    required bool value,
  });

  Future<void> setInt(
    String key, {
    required int value,
  });

  Future<void> setString(
    String key, {
    required String value,
  });
}
