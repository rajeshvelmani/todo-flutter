import 'package:flutter/material.dart';

import 'package:my_app/model/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  TodoItem(this.todo);

  @override
  _TodoItemState createState() => _TodoItemState(todo);
}

class _TodoItemState extends State<TodoItem> {
  Todo todo;

  // TextEditingController _controller;

  _TodoItemState(this.todo);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Container(
        child: InkWell(
          onTap: () {
            setState(() {
              todo.status = !todo.status;
            });
          },
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: todo.status ? Colors.green : Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: todo.status
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.check_circle_outline,
                          color: Colors.blue,
                        ),
                ),
              ),
              Text(todo.title),
            ],
          ),
        ),
      ),
    );
  }

  void onChange(bool newValue) {
    setState(
      () {
        todo.status = newValue;
      },
    );
  }
}
