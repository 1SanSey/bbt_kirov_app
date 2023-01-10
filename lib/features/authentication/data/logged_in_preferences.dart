import 'package:shared_preferences/shared_preferences.dart';

class LoggedInUserPreferences {
  static const loggedInPref = "loggedInPref";
  static const usernamePref = "usernamePref";
  static const emailPref = "emailPref";
  static const photoPref = "photoPref";

  setStateUser(
      bool loggedIn, String username, String email, String photo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(loggedInPref, loggedIn);
    sharedPreferences.setString(usernamePref, username);
    sharedPreferences.setString(emailPref, email);
    sharedPreferences.setString(photoPref, photo);
  }

  getStateUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(loggedInPref) ?? false;
  }

  getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(usernamePref) ?? '';
  }

  getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(emailPref) ?? '';
  }

  getUserPhoto() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(photoPref) ?? '';
  }
}
