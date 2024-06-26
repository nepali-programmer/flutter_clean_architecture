import 'dart:convert';

import 'package:flutter_clean_architecture/feature/todo/domain/entity/todo.dart';

class TodoDto extends Todo {
  const TodoDto({
    required super.userId,
    required super.id,
    required super.title,
    required super.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoDto.fromMap(Map<String, dynamic> map) {
    return TodoDto(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toRawJson() => json.encode(toMap());

  factory TodoDto.fromRawJson(String source) =>
      TodoDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
