import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/todo-list-data.dart';

class TodoInput extends StatefulWidget {
  TodoInput();

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add Todo',
                ),
                textAlign: TextAlign.center,
                controller: myController,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              final value = myController.text;

              if (value != null && value.length > 0) {
                Provider.of<TodoListData>(context).addTodo(value);
                myController.text = '';
              }
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeData().primaryColor,
              ),
              child: Icon(
                Icons.add,
                size: 35.0,
                color: Colors.white70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
