import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/feature/setting/domain/usecase/get_dark_mode_usecase.dart';
import 'package:flutter_clean_architecture/feature/setting/domain/usecase/set_dark_mode_usecase.dart';
import 'package:injectable/injectable.dart';

part 'setting_state.dart';

@LazySingleton()
class SettingCubit extends Cubit<SettingState> {
  final GetDarkModeUsecase _getDarkModeUsecase;
  final SetDarkModeUsecase _setDarkModeUsecase;
  SettingCubit(
    this._getDarkModeUsecase,
    this._setDarkModeUsecase,
  ) : super(SettingState(
          darkMode: _getDarkModeUsecase(),
        ));

  bool getDarkMode() => _getDarkModeUsecase();

  Future<void> setDarkMode(bool darkMode) async {
    await _setDarkModeUsecase(darkMode);
    emit(state.copyWith(darkMode: darkMode));
  }
}
