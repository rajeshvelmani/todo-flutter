import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/todo-list-data.dart';

class CurvedNavBar extends StatelessWidget {
  const CurvedNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      color: Theme.of(context).primaryColor,
      index: 1,
      items: <Widget>[
        getIconForNav(
          Icons.adjust,
          Colors.blueAccent,
        ),
        getIconForNav(
          Icons.access_time,
          Colors.deepOrangeAccent,
        ),
        getIconForNav(
          Icons.check_circle_outline,
          Colors.green,
        ),
      ],
      onTap: (index) {
        Provider.of<TodoListData>(context, listen: false).getTodoList(index);
      },
    );
  }

  Widget getIconForNav(IconData iconData, Color color) {
    return Icon(
      iconData,
      size: 30,
      color: color,
    );
  }
}
