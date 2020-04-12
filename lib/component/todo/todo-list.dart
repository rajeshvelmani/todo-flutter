import 'package:flutter/material.dart';
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
            return InkWell(
              onTap: () {
                setState(() {
                  _todoListData.todoList[index].status =
                      !_todoListData.todoList[index].status;
                });
              },
              child: Column(
                children: <Widget>[
                  Dismissible(
                    key: Key(_todoListData.todoList[index].key),
                    direction: DismissDirection.endToStart,
                    child: TodoItem(
                      _todoListData.todoList[index],
                    ),
                    onDismissed: (direction) {
                      Provider.of<TodoListData>(context)
                          .deleteTodo(_todoListData.todoList[index].key);
                    },
                    background: Container(),
                    secondaryBackground: Container(
                      padding: EdgeInsets.only(right: 15.0),
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("Delete"),
                          Icon(
                            Icons.delete,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
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
