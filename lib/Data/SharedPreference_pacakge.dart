import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceUtils {
  static late SharedPreferences _sharedPreferences;

  // Initialize the shared preferences instance
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Set data in shared preferences
  static Future<void> setData({required String key, required dynamic value}) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else {
      throw Exception("Unsupported value type");
    }
  }

  // Get data from shared preferences
  static Future<dynamic> getData({required String key}) async {
    return _sharedPreferences.get(key);
  }

  // Delete data from shared preferences
  static Future<void> deleteData({required String key}) async {
    await _sharedPreferences.remove(key);
  }
}
