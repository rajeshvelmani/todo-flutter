import 'package:flutter/material.dart';
import '../component/todo/todo-list.dart';
import '../component/todo/todo-input.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Container(
                child: TodoList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: TodoInput(),
            ),
          ],
        ),
      ),
    );
  }
}
