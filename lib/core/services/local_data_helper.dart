import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences pref;
  static String? tokenkey;
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static cashData(String key, dynamic value) async {
    if (value is String) {
      value = await pref.setString(key, value);
    } else if (value is int) {
      value = await pref.setInt(key, value);
    } else if (value is bool) {
      value = await pref.setBool(key, value);
    } else if (value is double) {
      value = await pref.setDouble(key, value);
    } else if (value is List<String>) {
      value = await pref.setStringList(key, value);
    }
  }

  static getDate(String key) {
    return pref.get(key);
  }
}
