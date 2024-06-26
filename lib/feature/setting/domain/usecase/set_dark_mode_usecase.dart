import 'package:flutter_clean_architecture/feature/setting/domain/repository/setting_respository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SetDarkModeUsecase {
  final SettingRepository _respository;
  const SetDarkModeUsecase(this._respository);

  Future<void> call(bool darkMode) async => _respository.setDarkMode(darkMode);
}