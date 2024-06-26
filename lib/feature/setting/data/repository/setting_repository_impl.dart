import 'package:flutter_clean_architecture/feature/setting/data/source/setting_local_source.dart';
import 'package:flutter_clean_architecture/feature/setting/domain/repository/setting_respository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalSource _settingLocalSource;
  SettingRepositoryImpl(this._settingLocalSource);

  @override
  bool getDarkMode() {
    return  _settingLocalSource.getDarkMode();
  }

  @override
  Future<void> setDarkMode(bool darkMode) async {
    await _settingLocalSource.setDarkMode(darkMode);
  }
}