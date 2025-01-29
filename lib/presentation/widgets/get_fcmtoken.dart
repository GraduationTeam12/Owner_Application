// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

// late FlutterLocalNotificationsPlugin _localNotifications;
class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;  

  static Future init() async {
     
    await messaging.requestPermission();


    token = await messaging.getToken();

    if (token != null) {
      print('FCM Token: $token');
    } else {
      print('Failed to get FCM Token');
    }

  //   Future<void> _showNotification(String? title, String? body) async {
  //   const androidDetails = AndroidNotificationDetails(
  //     'channel_id', 'channel_name',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     icon: 'app_icon',
  //   );
  //   const notificationDetails = NotificationDetails(android: androidDetails);

  //   await _localNotifications.show(
  //     0,
  //     title,
  //     body,
  //     notificationDetails,
  //   );
  // }


    
  }
}