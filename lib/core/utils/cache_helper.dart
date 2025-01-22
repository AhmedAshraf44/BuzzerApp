import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData<T>(
      {required String key, required dynamic value}) async {
    return await _prefs.setString(key, value);
  }

  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }
}
