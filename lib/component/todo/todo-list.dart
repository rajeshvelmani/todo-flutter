import 'package:flutter/material.dart';
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

  void loadListItem(_) {
    _.getTodos();
  }

  @override
  build(BuildContext context) {
    _todoListData = Provider.of<TodoListData>(context, listen: false);
    if (_todoListData.filteredList == null) {
      loadListItem(_todoListData);

      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_todoListData.filteredList.length > 0) {
      return Container(
        child: ListView.separated(
          itemCount: _todoListData.filteredList.length,
          separatorBuilder: (context, index) {
            return Divider(height: 1.0);
          },
          itemBuilder: (context, index) {
            return listViewWidget(index);
          },
        ),
      );
    }
    return emptyListWidget;
  }

  get emptyListWidget {
    return Center(
      child: Text(
        "You're all done",
        style: TextStyle(
          color: Theme.of(context).disabledColor,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget listViewWidget(index) {
    return InkWell(
      onTap: () {
        _todoListData.changeStatus(_todoListData.filteredList[index]);
      },
      child: Column(
        children: <Widget>[
          Dismissible(
            key: Key(_todoListData.filteredList[index].id),
            direction: DismissDirection.endToStart,
            child: TodoItem(
              _todoListData.filteredList[index],
            ),
            onDismissed: (direction) {
              _todoListData.delete(_todoListData.filteredList[index].id);
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
