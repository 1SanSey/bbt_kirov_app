import 'package:bbt_kirov_app/features/authentication/data/logged_in_preferences.dart';

class LoggedInUserModel {
  late bool _isLoggedIn;
  late String _username;
  late String _email;
  late String _photo;
  late LoggedInUserPreferences _preferences;
  bool get isLoggedIn => _isLoggedIn;

  LoggedInUserModel() {
    _isLoggedIn = false;
    _username = '';
    _email = '';
    _photo = '';
    _preferences = LoggedInUserPreferences();
    getPreferences();
  }

  void setLoggedInUser(
      {required bool isLogged,
      required String username,
      required String email,
      required String photo}) {
    _isLoggedIn = isLogged;
    _username = username;
    _email = email;
    _photo = photo;
    _preferences.setStateUser(isLogged, username, email, photo);
  }

  getPreferences() async {
    _isLoggedIn = await _preferences.getStateUser();
    _username = await _preferences.getUserName();
    _email = await _preferences.getUserEmail();
    _photo = await _preferences.getUserPhoto();
  }
}
