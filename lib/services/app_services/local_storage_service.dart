import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  void saveDataToDisk<T>(String key, T content) {
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is String) {
      _preferences!.setString(key, content);
    }
  }

  getDataFromDisk(String key) {
    return _preferences!.get(key);
  }

  removeDataFromDisk(key) {
    _preferences!.remove(key);
  }

  clearAllDataFromDisk() {
    _preferences!.clear();
  }
}
