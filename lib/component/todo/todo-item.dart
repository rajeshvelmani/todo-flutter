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

  bool isCircle = true;

  @override
  Widget build(BuildContext context) {
    if (!isCircle) {
      return Container(
        child: CheckboxListTile(
          title: Text(todo.title),
          value: todo.status,
          onChanged: (bool newValue) {
            onChange(newValue);
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      );
    } else {
      return Container(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  todo.status = !todo.status;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: todo.status ? Colors.green : Colors.blue[50]),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: todo.status
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: ThemeData().primaryColor,
                        ),
                ),
              ),
            ),
            Expanded(
              // child: TextField(
              //   controller: new TextEditingController(text: todo.title),
              // ),

              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void onChange(bool newValue) {
    setState(
      () {
        todo.status = newValue;
      },
    );
  }
}
