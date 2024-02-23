import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  sendNotification() {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "Kevin Test",
      "Kevin Test",
      icon: '@mipmap/ic_launcher',
      priority: Priority.max,
      importance: Importance.max,
      enableVibration: true,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.show(
      0,
      "Kevin Notification Test",
      "Notification Body",
      platformChannelSpecifics,
    );

    // NotificationService().showNotification(event);
    // });
  }
}
