import 'package:flutter/material.dart';
import '../../model/todo.dart';
import 'package:provider/provider.dart';

import '../../model/todo-list-data.dart';

import './todo-item.dart';

class TodoList extends StatefulWidget {
  const TodoList();

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  _TodoListState();
  TodoListData _todoListData;

  List<Todo> _todoList;

  void loadListItem(_) {
    _.getTodos().then((value) {
      setState(() {
        _todoList = value;
      });
    });
  }

  @override
  build(BuildContext context) {
    _todoListData = Provider.of<TodoListData>(context, listen: false);
    if (_todoList == null) {
      loadListItem(_todoListData);

      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (hasListItem()) {
      return Container(
        child: ListView.separated(
          itemCount: _todoList.length,
          separatorBuilder: (context, index) {
            if (_todoListData.isFilterApplied &&
                _todoList[index].status == true) {
              return hiddenWidget;
            }
            return Divider(height: 1.0);
          },
          itemBuilder: (context, index) {
            if (_todoListData.isFilterApplied &&
                _todoList[index].status == true) {
              return hiddenWidget;
            }

            return listViewWidget(index);
          },
        ),
      );
    }
    return emptyListWidget;
  }

  bool hasListItem() {
    if (!_todoListData.isFilterApplied) {
      return _todoList.length > 0;
    }
    return _todoList.where((item) => !item.status).toList().length > 0;
  }

  get hiddenWidget {
    return Visibility(
      child: Text("hidden"),
      visible: false,
    );
  }

  get emptyListWidget {
    return Center(
      child: Text(
        "No Tasks",
        style: TextStyle(
          color: Theme.of(context).disabledColor,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget listViewWidget(index) {
    return InkWell(
      onTap: () {
        _todoListData.changeStatus(_todoList[index]);
      },
      child: Column(
        children: <Widget>[
          Dismissible(
            key: Key(_todoList[index].id),
            direction: DismissDirection.endToStart,
            child: TodoItem(
              _todoList[index],
            ),
            onDismissed: (direction) {
              _todoListData.delete(_todoList[index].id);
            },
            background: Container(),
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 15.0),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Delete"),
                  Icon(
                    Icons.delete,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
