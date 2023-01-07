import 'package:shared_preferences/shared_preferences.dart';

class LoggedInPreferences {
  static const loggedInPref = "loggedInPref";

  setStateUser(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(loggedInPref, value);
  }

  getStateUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(loggedInPref) ?? false;
  }
}
