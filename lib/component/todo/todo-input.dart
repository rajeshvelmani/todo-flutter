import 'package:flutter/material.dart';

class TodoInput extends StatefulWidget {
  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: new InputDecoration(hintText: "Add Your Task"),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(
            Icons.send,
            size: 40.0,
            color: ThemeData().primaryColor,
          )
        ],
      ),
    );
  }
}
