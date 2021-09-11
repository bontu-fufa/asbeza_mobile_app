import 'package:asbeza_mobile_app/todo/models/models.dart';

abstract class TodoEvent {}

class LoadTodo extends TodoEvent {
  final int userId;

  LoadTodo({required this.userId});
}

class AddTodoEvent extends TodoEvent {
  final int userId;
  final Todo todo;

  AddTodoEvent({required this.userId, required this.todo});
}

class UpdateTodo extends TodoEvent {
  final int userId;
  TodoAll todo;

  UpdateTodo({required this.userId, required this.todo});
}

class DeleteTodo extends TodoEvent {
  final int userId;
  final int itemId;

  DeleteTodo({required this.userId, required this.itemId});
}