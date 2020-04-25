import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
      bottomNavigationBar: CurvedNavBar(),
    );
  }
}
