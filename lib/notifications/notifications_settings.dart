import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_controller.dart';

@pragma('vm:entry-point')
Future<void> notificationServiceInitialization() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (!((await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled()) ??
      false)) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_bg_service_small');

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveBackgroundNotificationResponse:
        NotificationController.onDidReceiveLocalBackgroundNotification,
    onDidReceiveNotificationResponse:
        NotificationController.onDidReceiveLocalNotification,
  );
}
