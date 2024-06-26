// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_clean_architecture/di/di.dart' as _i15;
import 'package:flutter_clean_architecture/feature/setting/data/repository/setting_repository_impl.dart'
    as _i11;
import 'package:flutter_clean_architecture/feature/setting/data/source/setting_local_source.dart'
    as _i7;
import 'package:flutter_clean_architecture/feature/setting/domain/repository/setting_respository.dart'
    as _i10;
import 'package:flutter_clean_architecture/feature/setting/domain/usecase/get_dark_mode_usecase.dart'
    as _i12;
import 'package:flutter_clean_architecture/feature/setting/domain/usecase/set_dark_mode_usecase.dart'
    as _i13;
import 'package:flutter_clean_architecture/feature/setting/presentation/cubit/setting/setting_cubit.dart'
    as _i14;
import 'package:flutter_clean_architecture/feature/todo/data/repository/todo_repository_impl.dart'
    as _i6;
import 'package:flutter_clean_architecture/feature/todo/data/source/todo_remote_source.dart'
    as _i4;
import 'package:flutter_clean_architecture/feature/todo/domain/repository/todo_repository.dart'
    as _i5;
import 'package:flutter_clean_architecture/feature/todo/domain/usecase/get_todo_list_usecase.dart'
    as _i8;
import 'package:flutter_clean_architecture/feature/todo/presentation/cubit/todo/todo_cubit.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.TodoRemoteSource>(() => _i4.TodoRemoteSource());
    gh.lazySingleton<_i5.TodoRepository>(
        () => _i6.TodoRepositoryImpl(gh<_i4.TodoRemoteSource>()));
    gh.lazySingleton<_i7.SettingLocalSource>(
        () => _i7.SettingLocalSource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i8.GetTodoListUsecase>(
        () => _i8.GetTodoListUsecase(gh<_i5.TodoRepository>()));
    gh.lazySingleton<_i9.TodoCubit>(
        () => _i9.TodoCubit(gh<_i8.GetTodoListUsecase>()));
    gh.lazySingleton<_i10.SettingRepository>(
        () => _i11.SettingRepositoryImpl(gh<_i7.SettingLocalSource>()));
    gh.lazySingleton<_i12.GetDarkModeUsecase>(
        () => _i12.GetDarkModeUsecase(gh<_i10.SettingRepository>()));
    gh.lazySingleton<_i13.SetDarkModeUsecase>(
        () => _i13.SetDarkModeUsecase(gh<_i10.SettingRepository>()));
    gh.lazySingleton<_i14.SettingCubit>(() => _i14.SettingCubit(
          gh<_i12.GetDarkModeUsecase>(),
          gh<_i13.SetDarkModeUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
