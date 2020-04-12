import 'package:flutter/material.dart';
import 'package:my_app/component/utils/slide-menu.dart';
import 'package:my_app/model/todo.dart';
import 'package:provider/provider.dart';

import 'package:my_app/model/todo-list-data.dart';

import './todo-item.dart';

class TodoList extends StatefulWidget {
  const TodoList();

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  _TodoListState();

  @override
  Widget build(BuildContext context) {
    TodoListData _todoListData = Provider.of<TodoListData>(context);
    List<Todo> _todoList = _todoListData.todoList;

    if (_todoList.length > 0) {
      return Container(
        child: ListView.builder(
          itemCount: _todoListData.todoList.length,
          itemBuilder: (context, index) {
            return Column(
              key: Key(_todoListData.todoList[index].key),
              children: [
                SlideMenu(
                  child: TodoItem(_todoListData.todoList[index]),
                  menuItems: <Widget>[
                    new Container(
                      child: new IconButton(
                        onPressed: () {
                          Provider.of<TodoListData>(context)
                              .deleteTodo(_todoListData.todoList[index].key);
                        },
                        icon: new Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    return Center(
      child: Text(
        "Your Todo List is Empty",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
