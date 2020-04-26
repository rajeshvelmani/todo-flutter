import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './todo-form.dart';
import '../../model/todo-list-data.dart';

class Header extends StatelessWidget {
  void _showModalSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return TodoForm();
        });
  }

  @override
  Widget build(BuildContext context) {
    TodoListData _todoListData =
        Provider.of<TodoListData>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
        bottom: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            alignment: Alignment.centerLeft,
            child: getTitleText(_todoListData.pageTitle),
          ),
          getIconButtonForHeader(context),
        ],
      ),
    );
  }

  Widget getIconButtonForHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          size: 30.0,
          // color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          _showModalSheet(context);
        },
      ),
    );
  }

  getTitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
