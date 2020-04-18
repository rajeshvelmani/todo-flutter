import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme/theme.dart';
import './component/todo/todo-list.dart';
import './component/todo/todo-input.dart';
import './model/todo-list-data.dart';
import './component/todo/header.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TodoListData()),
          ],
          child: Scaffold(
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: Colors.transparent,
            //   actions: <Widget>[],
            // ),
            body: Column(
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
      ),
    );
  }
}
