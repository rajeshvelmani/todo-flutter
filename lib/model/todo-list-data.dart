import 'package:flutter/material.dart';

import './todo.dart';

class TodoListData extends ChangeNotifier {
  List<Todo> todoList = [];

  addTodo(title) {
    todoList.add(Todo(title, false));
    notifyListeners();
  }
}
