import 'package:flutter/material.dart';

import '../component/todo/CurvedNavBar.dart';
import '../component/todo/todo-list.dart';
import '../component/todo/todo-input.dart';
import '../component/todo/header.dart';

class HomePage extends StatelessWidget {
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
              margin: const EdgeInsets.symmetric(vertical: 18.0),
              child: TodoInput(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavBar(),
    );
  }
}
