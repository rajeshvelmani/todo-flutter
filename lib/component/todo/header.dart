import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/todo-list-data.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TodoListData _todoListData;

  @override
  Widget build(BuildContext context) {
    _todoListData = Provider.of<TodoListData>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            alignment: Alignment.centerLeft,
            child: titleText,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
            child: iconButtonForHeader,
          ),
        ],
      ),
    );
  }

  get iconButtonForHeader {
    return IconButton(
      icon: Icon(
        Icons.filter_list,
        size: 30.0,
      ),
      onPressed: _todoListData.applyFilter,
    );
  }

  get titleText {
    return Text(
      _todoListData.isFilterApplied ? 'Pending' : 'All Tasks',
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }
}
