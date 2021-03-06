import 'package:flutter/material.dart';

import '../../model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  TodoItem(this.todo);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: todo.status ? Colors.green : Theme.of(context).primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: todo.status
              ? Icon(
                  Icons.check,
                  color: Colors.white70,
                  size: 15,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: Theme.of(context).primaryColor,
                  size: 15,
                ),
        ),
      ),
      title: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Text(
          todo.title,
          style: TextStyle(
            fontSize: 24.0,
            decoration:
                todo.status ? TextDecoration.lineThrough : TextDecoration.none,
            color: todo.status
                ? Theme.of(context).disabledColor
                : Theme.of(context).textTheme.button.color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      subtitle: Text(
        todo.getFormatedReminder(),
      ),
    );
  }
}
