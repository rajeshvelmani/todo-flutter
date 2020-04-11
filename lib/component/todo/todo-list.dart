import 'package:flutter/material.dart';
import '../../model/todo.dart';

import './todo-item.dart';

class TodoList extends StatefulWidget {
  final List<Todo> _todoList;

  const TodoList(this._todoList);

  @override
  _TodoListState createState() => _TodoListState(this._todoList);
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todoList;

  List<TodoItem> getTodoItems() {
    List<TodoItem> todoItems = [];
    for (final todo in _todoList) {
      todoItems.add(TodoItem(todo));
    }
    return todoItems;
  }

  _TodoListState(this._todoList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: getTodoItems(),
      ),
    );
  }
}
