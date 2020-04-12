import 'package:flutter/material.dart';

import './todo.dart';

class TodoListData extends ChangeNotifier {
  List<Todo> todoList = [];

  Future<List<Todo>> getTodos() async {
    todoList = await todos();
    print(todoList);
    return todoList;
  }

  addTodo(title) {
    final id = 'todo_item_${todoList.length}';
    Todo todo = new Todo(id: id, title: title, status: false);
    insertTodo(todo);
    todoList.add(todo);
    notifyListeners();
  }

  changeStatus(Todo todo) {
    todo.status = !todo.status;
    updateTodo(todo);
    notifyListeners();
  }

  delete(id) {
    var x = todoList.indexWhere((listItem) => listItem.id == id);
    deleteTodo(id);
    todoList.removeAt(x);
    notifyListeners();
  }
}
