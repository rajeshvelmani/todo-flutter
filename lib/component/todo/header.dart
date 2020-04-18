import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Color(0xFF000000),
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'ToDo',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.filter_list,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
