import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../component/todo/todo-form.dart';
import '../component/utils/local-push-notification.dart';
import '../component/todo/CurvedNavBar.dart';
import '../component/todo/todo-list.dart';
import '../component/todo/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    LocalPushNotification.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Container(
                child: TodoList(),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 18.0),
            //   child: TodoInput(),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: FABBottomAppBar(
      //   notchedShape: CircularNotchedRectangle(),
      //   items: [
      //     FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
      //     FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
      //   ],
      // ),
      floatingActionButton: getFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavBar(),
    );
  }

  getFloatingButton() {
    return SizedBox(
      height: 50,
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (builder) {
                return TodoForm();
              });
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
      ),
    );
  }
}
