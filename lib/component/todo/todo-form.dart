import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/datetime.dart';
import '../../model/todo-list-data.dart';

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _title;
  DateTime _reminder;
  int _limit = 3;
  final _submitText = 'Add';

  String _validateTitle(String value) {
    if (value.trim().length < _limit) {
      return 'enter valid input';
    }

    return null;
  }

  _addTodo(context) {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      Provider.of<TodoListData>(context, listen: false).addTodo(
        _title,
        _reminder,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: (screenSize.height * 0.225) +
            MediaQuery.of(context).viewInsets.vertical,
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: this._formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'New Task',
                  ),
                  validator: this._validateTitle,
                  onSaved: (String value) {
                    _title = value.trim();
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                DateTimeComponent(
                  height: screenSize.height * 0.2,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2022, 12, 31),
                  callBack: (DateTime selectedDate) {
                    _reminder = selectedDate;
                  },
                ),
                Container(
                  width: screenSize.width,
                  child: FlatButton(
                    child: Text(
                      _submitText,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () => _addTodo(context),
                  ),
                  // margin: EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
