import 'package:asbeza_mobile_app/todo/models/models.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<dynamic> todos;

  TodoLoaded({required this.todos});
}

class TodoCreated extends TodoState {
  final Todo todo;
  TodoCreated({required this.todo});
}

class TodoInProgress extends TodoState {}

class TodoUpdated extends TodoState {
  final TodoAll todo;

  TodoUpdated({required this.todo});
}

class TodoOperationFailed extends TodoState {}