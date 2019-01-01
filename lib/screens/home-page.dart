import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/todo/todo-list.dart';
import '../component/todo/todo-input.dart';
import '../model/todo-list-data.dart';
import '../component/todo/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoListData()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Header(),
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
