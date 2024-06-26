part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoLoading extends TodoState {}

final class TodoError extends TodoState {
  final String message;

  const TodoError({required this.message});
}

final class TodoLoaded extends TodoState {
  final List<Todo> list;

  const TodoLoaded({required this.list});
}
