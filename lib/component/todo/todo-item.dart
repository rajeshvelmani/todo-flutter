import 'package:flutter/material.dart';

import '../../model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Container(
        child: Row(
          children: <Widget>[
            Container(
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
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(16.0),
              child: Text(todo.title),
            ),
          ],
        ),
      ),
    );
  }
}
