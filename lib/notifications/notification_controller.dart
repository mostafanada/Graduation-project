import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationController {
  @pragma('vm:entry-point')
  static Future<void> onDidReceiveLocalNotification(
      NotificationResponse notificationResponse) async {}

  @pragma('vm:entry-point')
  static Future<void> onDidReceiveLocalBackgroundNotification(
      NotificationResponse notificationResponse) async {}
}
