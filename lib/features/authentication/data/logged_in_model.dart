import 'package:bbt_kirov_app/features/authentication/data/logged_in_preferences.dart';

class LoggedInModel {
  late bool _isLoggedIn;
  late LoggedInPreferences _preferences;
  bool get isLoggedIn => _isLoggedIn;

  LoggedInModel() {
    _isLoggedIn = false;
    _preferences = LoggedInPreferences();
    getPreferences();
  }

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    _preferences.setStateUser(value);
  }

  getPreferences() async {
    _isLoggedIn = await _preferences.getStateUser();
  }
}
