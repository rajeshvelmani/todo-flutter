import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DateTimeComponent extends StatefulWidget {
  final DateTime minTime;
  final DateTime maxTime;
  final double height;
  final Color color;
  final Function callBack;
  final bool showError;

  DateTimeComponent({
    Key key,
    this.minTime,
    this.maxTime,
    @required this.callBack,
    this.height = 210.0,
    this.color = Colors.lightBlue,
    this.showError = false,
  }) : super(key: key);

  @override
  _DateTimeComponentState createState() => _DateTimeComponentState();
}

class _DateTimeComponentState extends State<DateTimeComponent> {
  String _date = 'Choose Reminder';

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          minTime: widget.minTime,
          maxTime: widget.maxTime,
          onConfirm: (date) {
            print('confirm $date');
            setState(() {
              _date = '${DateFormat('EEE, MMM d, yyyy h:mm a').format(date)}';
            });
            widget.callBack(date);
          },
          currentTime: DateTime.now(),
          theme: DatePickerTheme(
            backgroundColor: Theme.of(context).backgroundColor,
            cancelStyle: Theme.of(context).textTheme.subtitle.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).errorColor,
                ),
            doneStyle: Theme.of(context).textTheme.subtitle.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).accentColor,
                ),
            itemStyle: Theme.of(context).textTheme.title,
            containerHeight: widget.height,
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.alarm_add,
                        color: widget.color,
                        size: 20.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        "$_date",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: widget.showError
                              ? Theme.of(context).errorColor
                              : Theme.of(context).textTheme.title.color,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              "Change",
              style: TextStyle(
                color: widget.color,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
