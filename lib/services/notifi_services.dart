import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home/homePage/components/notification_box.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  String fullname = '';

  void getFullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email',
        isEqualTo: prefs.getString('email')) // add your condition here
        .get();

    // get data from the first document in the snapshot
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};

    fullname = data != null && data is Map<String, dynamic>
        ? data['fullname']
        : 'Chào bạn!';
  }

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    getFullname();
  }

  Future<void> initializeNotifications() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('lauch_img');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification tap
  }

  Future<void> showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.high, priority: Priority.high);
    var iosDetails = IOSNotificationDetails();
    var notificationDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);
    await flutterLocalNotificationsPlugin.show(
        0, '${fullname} ơi đã đến giờ học rồi', 'Bạn chỉ cần 10 phút để tiến bộ mỗi ngày. Gét go !', notificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Example')),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Notification'),
          onPressed: () {
            showNotification();
          },
        ),
      ),
    );
  }
}
