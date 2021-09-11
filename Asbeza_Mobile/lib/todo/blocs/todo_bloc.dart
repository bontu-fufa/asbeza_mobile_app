import 'package:asbeza_mobile_app/todo/models/models.dart';

import 'blocs.dart';
import 'package:asbeza_mobile_app/todo/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({required this.todoRepository}) : super(TodoLoading());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {

    if (event is AddTodoEvent) {
      int userId = event.userId;
      try {
        final todo = await todoRepository.create(userId, event.todo);
        // final items = await todoRepository.fetchAll();
        yield TodoCreated(todo: todo);
        yield TodoInProgress();
        final todos = await todoRepository.fetchAll(userId);
        yield TodoLoaded(todos: todos);
      } catch (e) {
        print("$e");
      }
    }

    if (event is LoadTodo) {
      int userId = event.userId;

      try {
        yield TodoInProgress();
        final todos = await todoRepository.fetchAll(userId);
        yield TodoLoaded(todos: todos);
      } catch (e) {
        print(e);
        yield TodoOperationFailed();
      }
    }

    if (event is UpdateTodo) {
      int userId = event.userId;
      TodoAll todoAll = event.todo;

      try {
        yield TodoInProgress();
        final todo = await todoRepository.update(userId, todoAll);
        final todos = await todoRepository.fetchAll(userId);
        yield TodoLoaded(todos: todos);
      } catch (e) {
        print(e);
        yield TodoOperationFailed();
      }
    }

    if (event is DeleteTodo) {
      int userId = event.userId;
      int itemId = event.itemId;

      try {
        yield TodoInProgress();
        final deletedTodo = await todoRepository.delete(userId, itemId);
        final todos = await todoRepository.fetchAll(userId);
        yield TodoLoaded(todos: todos);
      } catch (e) {
        print(e);
        yield TodoOperationFailed();
      }
    }
  }
}
