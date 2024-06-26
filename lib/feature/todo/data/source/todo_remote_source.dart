import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class TodoRemoteSource {
  final dio = Dio();

  Future<Response> getTodoList() {
    return dio.get('https://jsonplaceholder.typicode.com/todos');
  }
}