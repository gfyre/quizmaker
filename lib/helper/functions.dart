import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class HelperFunctions {
  static String userLogInKey = "USERLOGINKEY";

  static saveUserLoginDetails({@required bool isLoggedIn}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLogInKey, isLoggedIn);
  }

  static Future<bool> getUserLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLogInKey);
  }
}
