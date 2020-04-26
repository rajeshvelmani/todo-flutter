import 'package:flutter/material.dart';
import 'package:todo/component/utils/local-push-notification.dart';

import './todo.dart';

class TodoListData extends ChangeNotifier {
  List<Todo> todoList = [];
  List<String> pageTitleList = ['All Tasks', 'Pending', 'Completed'];
  List<Todo> filteredList;
  int filteredIndex = 1;
  String pageTitle = 'Pending';

  getTodos() async {
    todoList = await todos();
    getTodoList(filteredIndex);
  }

  void getTodoList(index) {
    switch (index) {
      case 1:
        filteredList = todoList.where((todo) => !todo.status).toList();
        break;
      case 2:
        filteredList = todoList.where((todo) => todo.status).toList();
        break;
      default:
        filteredList = todoList;
    }
    filteredIndex = index;
    pageTitle = pageTitleList[index];
    notifyListeners();
  }

  addTodo(title, reminder) {
    final id = '${UniqueKey().hashCode}';
    Todo todo = new Todo(
      id: id,
      title: title,
      status: false,
      reminder: reminder,
    );
    insertTodo(todo);
    todoList.add(todo);
    getTodoList(filteredIndex);
    LocalPushNotification.scheduleNotification(
      int.parse(todo.id),
      reminder,
      'Attention',
      title,
    );
  }

  changeStatus(Todo todo) {
    todo.status = !todo.status;
    updateTodo(todo);
    getTodoList(filteredIndex);
    LocalPushNotification.cancelNotification(int.parse(todo.id));
  }

  delete(id) {
    deleteTodo(id);
    todoList.removeWhere((listItem) => listItem.id == id);
    getTodoList(filteredIndex);
    LocalPushNotification.cancelNotification(int.parse(id));
  }
}
