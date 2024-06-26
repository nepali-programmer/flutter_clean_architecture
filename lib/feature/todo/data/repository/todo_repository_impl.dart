import 'package:flutter_clean_architecture/feature/todo/data/dto/todo_dto.dart';
import 'package:flutter_clean_architecture/feature/todo/data/source/todo_remote_source.dart';
import 'package:flutter_clean_architecture/feature/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architecture/feature/todo/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteSource _todoRemoteSource;
  TodoRepositoryImpl(this._todoRemoteSource);
  @override
  Future<List<Todo>> getTodoList() async {
    try {
      var response = await _todoRemoteSource.getTodoList();
      final list = (response.data as List<dynamic>)
          .map((e) => TodoDto.fromMap(e))
          .toList();
      return list;
    } catch(e) {
      rethrow;
    }
  }
}