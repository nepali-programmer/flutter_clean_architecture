import 'package:flutter_clean_architecture/feature/setting/domain/repository/setting_respository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetDarkModeUsecase {
  final SettingRepository _respository;
  const GetDarkModeUsecase(this._respository);

  bool call() => _respository.getDarkMode();
}