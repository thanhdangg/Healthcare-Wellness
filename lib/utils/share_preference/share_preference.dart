import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static const String isFirstLaunchKey = 'isFirstLaunch';

  static Future<bool> isFirstLaunch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(isFirstLaunchKey) ?? true;
  }

  static Future<void> setFirstLaunch(bool isFirstLaunch) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(isFirstLaunchKey, isFirstLaunch);
  }
}