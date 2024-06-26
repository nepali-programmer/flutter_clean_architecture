// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_clean_architecture/feature/todo/data/repository/todo_repository_impl.dart'
    as _i5;
import 'package:flutter_clean_architecture/feature/todo/data/source/todo_remote_source.dart'
    as _i3;
import 'package:flutter_clean_architecture/feature/todo/domain/repository/todo_repository.dart'
    as _i4;
import 'package:flutter_clean_architecture/feature/todo/domain/usecase/get_todo_list_usecase.dart'
    as _i6;
import 'package:flutter_clean_architecture/feature/todo/presentation/cubit/todo/todo_cubit.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.TodoRemoteSource>(() => _i3.TodoRemoteSource());
    gh.lazySingleton<_i4.TodoRepository>(
        () => _i5.TodoRepositoryImpl(gh<_i3.TodoRemoteSource>()));
    gh.lazySingleton<_i6.GetTodoListUsecase>(
        () => _i6.GetTodoListUsecase(gh<_i4.TodoRepository>()));
    gh.lazySingleton<_i7.TodoCubit>(
        () => _i7.TodoCubit(gh<_i6.GetTodoListUsecase>()));
    return this;
  }
}
