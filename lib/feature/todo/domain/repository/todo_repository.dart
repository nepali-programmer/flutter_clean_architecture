import 'package:flutter_clean_architecture/feature/todo/domain/entity/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodoList();
}