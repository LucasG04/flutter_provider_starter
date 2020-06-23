import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<SharedPreferences> _sharedPreference;
  static const String current_theme = "system";

  SharedPreferenceHelper() {
    _sharedPreference = SharedPreferences.getInstance();
  }

  /// Sets the theme to a new value and stores in sharedpreferences
  Future<void> changeTheme(String value) {
    return _sharedPreference.then((prefs) {
      return prefs.setString(current_theme, value);
    });
  }

  /// Gets the current theme stored in sharedpreferences.
  /// If no theme returns 'system'
  Future<String> get getCurrentTheme {
    return _sharedPreference.then((prefs) {
      String currentTheme = prefs.getString(current_theme) ?? 'system';
      return currentTheme;
    });
  }
}
