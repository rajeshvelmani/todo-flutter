import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalPushNotification {
  static FlutterLocalNotificationsPlugin plugin;
  static void initialize(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  ) {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    plugin = flutterLocalNotificationsPlugin;
  }

  static Future onSelectNotification(String payload) async {
    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return new AlertDialog(
    //       title: Text("PayLoad"),
    //       content: Text("Payload : $payload"),
    //     );
    //   },
    // );
    print(payload);
  }

  // static Future showNotification(
  //   String title,
  //   String info,
  // ) async {
  //   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
  //     'your channel id',
  //     'your channel name',
  //     'your channel description',
  //     importance: Importance.Max,
  //     priority: Priority.High,
  //   );
  //   var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  //   var platformChannelSpecifics = new NotificationDetails(
  //     androidPlatformChannelSpecifics,
  //     iOSPlatformChannelSpecifics,
  //   );
  //   await plugin.show(
  //     1,
  //     title,
  //     info,
  //     platformChannelSpecifics,
  //     payload: 'Default_Sound',
  //   );
  // }

  static Future scheduleNotification(
      int id, DateTime reminderTime, String title, String subTitle) async {
    var scheduledNotificationDateTime = reminderTime.subtract(
      Duration(
        minutes: 0,
      ),
    );
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      importance: Importance.Max,
      priority: Priority.High,
      groupKey: 'group key',
      setAsGroupSummary: true,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );
    await plugin.schedule(
      id,
      title,
      subTitle,
      scheduledNotificationDateTime,
      platformChannelSpecifics,
    );
  }

  static cancelNotification(id) async {
    //TODO - Cancel Scheduled Notifications
    await plugin.cancel(id);
  }
}
