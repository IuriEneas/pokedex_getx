import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class CustomNotification {
  final int id;
  final String title;
  final String body;
  final String? payload;

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
  });
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupAndroidDetails();
    _setupNotifications();
  }

  _setupAndroidDetails() {
    androidDetails = const AndroidNotificationDetails(
      'lembretes_notifications_details',
      'Lembretes',
      channelDescription: 'Este canal é para lembretes!',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
  }

  _setupNotifications() async {
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String? timeZoneName;

    try {
      timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (e) {
      print('Could not get the local timezone');
    }
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // Fazer: macOs, iOS, Linux...
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onDidReceiveNotificationResponse: (details) {
        switch (details.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            _onSelectNotification(details.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            break;
        }
      },
    );
  }

  _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Get.toNamed(payload);
    }
  }

  showNotificationScheduled(
      CustomNotification notification, Duration duration) {
    final date = DateTime.now().add(duration);

    localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  showLocalNotification(CustomNotification notification) {
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
    );
  }

  checkForNotifications() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(details.notificationResponse!.payload);
    }
  }
}
