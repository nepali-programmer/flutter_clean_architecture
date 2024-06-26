import 'package:flutter_clean_architecture/feature/todo/domain/entity/todo.dart';
import 'package:flutter_clean_architecture/feature/todo/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetTodoListUsecase {
  final TodoRepository _repository;

  GetTodoListUsecase(this._repository);

  Future<List<Todo>> call() => _repository.getTodoList();
}