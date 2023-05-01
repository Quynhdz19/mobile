// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//   }
//
//   Future<void> initializeNotifications() async {
//     var initializationSettingsAndroid =
//     AndroidInitializationSettings('lauch_img');
//     var initializationSettingsIOS = IOSInitializationSettings();
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//   }
//
//   Future<void> onSelectNotification(String? payload) async {
//     // Handle notification tap
//   }
//
//   Future<void> showNotification() async {
//     var androidDetails = AndroidNotificationDetails(
//         'channelId', 'channelName', 'channelDescription',
//         importance: Importance.high, priority: Priority.high);
//     var iosDetails = IOSNotificationDetails();
//     var notificationDetails =
//     NotificationDetails(android: androidDetails, iOS: iosDetails);
//     await flutterLocalNotificationsPlugin.show(
//         0, 'Notification Title', 'Notification Body', notificationDetails);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Notification Example')),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Show Notification'),
//           onPressed: () {
//             showNotification();
//           },
//         ),
//       ),
//     );
//   }
// }
