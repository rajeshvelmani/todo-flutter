import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/todo-list-data.dart';
import '../../model/todo.dart';
import './todo-item.dart';

class TodoList extends StatefulWidget {
  const TodoList();

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  _TodoListState();
  TodoListData _todoListData;

  List<Todo> _todoList = [];

  void loadListItem(_) {
    _.getTodos().then((value) {
      setState(() {
        _todoList = value;
      });
    });
  }

  @override
  build(BuildContext context) {
    _todoListData = Provider.of<TodoListData>(context);

    if (_todoList.length > 0) {
      return Container(
        child: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return InkWell(
              // key: Key(_todoList[index].id),
              onTap: () {
                _todoListData.changeStatus(_todoList[index]);
              },
              child: Column(
                children: <Widget>[
                  Dismissible(
                    key: Key(_todoList[index].id),
                    direction: DismissDirection.endToStart,
                    child: TodoItem(
                      _todoList[index],
                    ),
                    onDismissed: (direction) {
                      Provider.of<TodoListData>(context)
                          .delete(_todoList[index].id);
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
    loadListItem(_todoListData);
    return Center(
      child: Text(
        "Your ToDo List is Empty",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
