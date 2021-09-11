import 'package:asbeza_mobile_app/todo/data_providers/todo_data_provider.dart';
import 'package:asbeza_mobile_app/todo/models/models.dart';

class TodoRepository {
  final TodoDataProvider dataProvider;
  TodoRepository({required this.dataProvider});

  Future<dynamic> create(int userId, Todo todo) async {
    return this.dataProvider.create(userId, todo);
  }

  Future<dynamic> update(int id, TodoAll todo) async {
    return this.dataProvider.update(id, todo);
  }

  Future<List<dynamic>> fetchAll(int userId) async {
    return this.dataProvider.fetchAll(userId);
  }

  Future<void> delete(int id, int itemId) async {
    this.dataProvider.delete(id, itemId);
  }
}