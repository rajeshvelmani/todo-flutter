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
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add Task Here',
                ),
                textAlign: TextAlign.center,
                controller: myController,
              ),
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              onPressed: () {
                final value = myController.text.trim();

                if (value != null && value.length > 0) {
                  Provider.of<TodoListData>(context, listen: false)
                      .addTodo(value);
                  myController.text = '';
                }
              },
              icon: Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
