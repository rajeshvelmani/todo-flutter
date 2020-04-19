import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/todo-list-data.dart';

class Header extends StatelessWidget {
//   @override
//   _HeaderState createState() => _HeaderState();
// }

// class _HeaderState extends State<Header> {

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
          // Padding(
          //   padding: const EdgeInsets.only(right: 16.0,),
          //   child: iconButtonForHeader,
          // ),
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
      onPressed: () => {},
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
