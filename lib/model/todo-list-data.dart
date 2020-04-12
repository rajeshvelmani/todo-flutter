import 'package:flutter/material.dart';

import './todo.dart';

class TodoListData extends ChangeNotifier {
  List<Todo> todoList = [];

  addTodo(title) {
    String key = 'todo_item_${todoList.length}';
    todoList.add(Todo(key, title, false));
    notifyListeners();
  }

  deleteTodo(key) {
    var x = todoList.indexWhere((listItem) => listItem.key == key); // 3

    todoList.removeAt(x);
    notifyListeners();
  }
}
