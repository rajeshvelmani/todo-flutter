import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './component/todo/todo-list.dart';
import './component/todo/todo-input.dart';
import 'package:my_app/model/todo-list-data.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoListData()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('Your Todo List'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: TodoList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TodoInput(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
