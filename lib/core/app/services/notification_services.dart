// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:qibla/core/app/constants.dart';
//
// /// Handles push and local notifications.
// class NotificationServices {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   /// Initializes the notification services.
//   static Future<void> initNotification() async {
//     await _messaging.requestPermission();
//
//     const settings = InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//
//     _flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: _onReceiveNotificationResponse,
//       onDidReceiveBackgroundNotificationResponse:
//           _onReceiveNotificationResponse,
//     );
//
//     FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
//   }
//
//   /// Gets the current device FCM token.
//   static Future<String> getUserDeviceToken() async {
//     return await _messaging.getToken() ?? "";
//   }
//
//
//   /// Handles local notification tap.
//   static Future<void> _onReceiveNotificationResponse(
//     NotificationResponse notificationResponse,
//   ) async {
//     try {
//       if (notificationResponse.payload != null) {
//         final data = jsonDecode(notificationResponse.payload!);
//         _performNavigation(data);
//       }
//     } catch (e) {
//       //print('❌ Error parsing payload: $e');
//     }
//   }
//   /// Handles FCM message when app is in foreground.
//   static Future<void> handleForegroundMessage() async {
//     FirebaseMessaging.onMessage.listen(_showBasicNotification);
//   }
//
//   /// Handles when app receives background FCM message.
//   static Future<void> _handleBackgroundMessage(RemoteMessage message) async {}
//
//   /// Performs navigation based on notification data.
//   static Future<void> _performNavigation(Map<String, dynamic> data) async {}
//
//   /// Shows basic notification when app is in foreground.
//   static Future<void> _showBasicNotification(RemoteMessage message) async {
//     final details = NotificationDetails(
//       android: AndroidNotificationDetails(
//         Constants.basicChannelId,
//         Constants.basicChannelName,
//         importance: Importance.max,
//         priority: Priority.max,
//         playSound: true,
//         colorized: true,
//         // sound: const RawResourceAndroidNotificationSound(
//         //     Constants.notificationSound),
//       ),
//       iOS: const DarwinNotificationDetails(
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true,
//       ),
//     );
//
//     await _flutterLocalNotificationsPlugin.show(
//       message.messageId.hashCode,
//       message.notification?.title,
//       message.notification?.body,
//       details,
//       payload: jsonEncode(message.data),
//     );
//   }
// }
