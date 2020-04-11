import 'package:flutter/material.dart';
import './model/todo.dart';
import './component/todo/todo-list.dart';
import './component/todo/todo-input.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final todoList = [
    Todo('item 1', false),
    Todo('item 2', false),
    Todo('item 3', false),
    Todo('item 4', true),
    Todo('item 5', false),
    Todo('item 6', false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: TodoList(todoList),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodoInput(),
            ),
          ],
        ),
      ),
    );
  }
}
