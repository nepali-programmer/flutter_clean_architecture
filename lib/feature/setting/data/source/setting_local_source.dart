import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SettingLocalSource {
  final SharedPreferences _pref;
  SettingLocalSource(this._pref);

  Future<void> setDarkMode(bool darkMode) async {
    _pref.setBool('DARK_MODE', darkMode);
  }

  bool getDarkMode() {
    return _pref.getBool('DARK_MODE') ?? false;
  }
}
