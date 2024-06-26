import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/feature/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architecture/feature/todo/domain/usecase/get_todo_list_usecase.dart';
import 'package:injectable/injectable.dart';

part 'todo_state.dart';

@LazySingleton()
class TodoCubit extends Cubit<TodoState> {
  final GetTodoListUsecase _getTodoListUsecase;
  TodoCubit(this._getTodoListUsecase) : super(TodoLoading());

  Future<void> getTodoList() async {
    try {
      emit(TodoLoading());
      var list = await _getTodoListUsecase();
      emit(TodoLoaded(list: list));
    } catch (e) {
      if (e is DioException) {
        emit(TodoError(message: e.message ?? e.toString()));
      } else {
        emit(TodoError(message: e.toString()));
      }
    }
  }
}
