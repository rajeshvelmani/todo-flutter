import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home-page.dart';
import './theme/theme.dart';
import './model/todo-list-data.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoListData(),
        ),
      ],
      child: Consumer<TodoListData>(
        builder: (context, todoListData, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
