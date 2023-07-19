import 'package:createachannel/notifications/notification_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> showNotification(dynamic event) async {
  final classification = event as String;
  const androidNotificationDetails = AndroidNotificationDetails(
    'audio',
    'Audio',
    channelDescription: 'for analyzing audio',
    category: AndroidNotificationCategory.service,
    visibility: NotificationVisibility.public,
    importance: Importance.low,
    enableVibration: false,
  );

  const notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  FlutterLocalNotificationsPlugin().show(
    888,
    'Sound',
    classification,
    notificationDetails,
  );
}
