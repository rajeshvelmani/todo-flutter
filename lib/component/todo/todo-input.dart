import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/model/todo-list-data.dart';

class TodoInput extends StatefulWidget {
  TodoInput();

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  addTodo() {
    // final value = myController.text;

    // if (value != null && value.length > 0) {
    //   setState(() {
    //     Provider.of<TodoListData>(context).addTodo();
    //   });
    //   myController.text = '';
    // }
  }

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
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add Todo',
              ),
              textAlign: TextAlign.center,
              controller: myController,
            ),
          ),
          RaisedButton(
            onPressed: () {
              final value = myController.text;

              if (value != null && value.length > 0) {
                Provider.of<TodoListData>(context).addTodo(value);
                myController.text = '';
              }
            },
            color: ThemeData().primaryColor,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            child: Icon(
              Icons.send,
              size: 40.0,
              color: Colors.white54,
            ),
          )
        ],
      ),
    );
  }
}
