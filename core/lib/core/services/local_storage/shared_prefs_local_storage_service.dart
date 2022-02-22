import 'package:core/core/services/local_storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsLocalStorageService implements LocalStorageService {
  late final SharedPreferences sharedPreferences;

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  bool? getBool({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }

  @override
  int? getInt({
    required String key,
  }) {
    return sharedPreferences.getInt(key);
  }

  @override
  String? getString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<void> setBool(
    String key, {
    required bool value,
  }) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> setInt(
    String key, {
    required int value,
  }) async {
    await sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> setString(
    String key, {
    required String value,
  }) async {
    await sharedPreferences.setString(key, value);
  }
}
