// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class ChachweHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putBoolan({
    required String? key,
    required bool? value,
  }) async {
    return await sharedPreferences?.setBool(key!, value!);
  }

  static bool? getBoolan({
    required String key,
  }) {
    return sharedPreferences?.getBool(key);
  }
}
