import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/no_reminder_box.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/reminder_box.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/toast/showToast.dart';

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

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

  Future<void> showNotification(String content) async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.high, priority: Priority.high);
    var iosDetails = IOSNotificationDetails();
    var notificationDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);
    if (content != null) {
      await flutterLocalNotificationsPlugin.show(
          10, '${fullname} bạn có lời nhắc: ', ' ${content} \n Chúc bạn ngày mới đầy năng lượng !', notificationDetails);

    } else {
      await flutterLocalNotificationsPlugin.show(
          10, '${fullname} ơi đã đến giờ học rồi', 'Bạn chỉ cần 10 phút để tiến bộ mỗi ngày. Gét go !', notificationDetails);

    }
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};
  TextEditingController _timeController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    getFullname();
    _selectedDate = _focusedDay;
    getId();
  }
  
  String uId = '';
  Future<void> getId()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email',
        isEqualTo: prefs.getString('email')) // add your condition here
        .get();
    // get data from the first document in the snapshot
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};
    setState(() {
      uId = data != null && data is Map<String, dynamic> ? data['uid'] : 0;
    });
  }

  Future<void> updateField(String collectionName, String documentId, String fieldName, dynamic value) async {
    final CollectionReference collection =
    FirebaseFirestore.instance.collection(collectionName);
    await collection.doc(documentId).update({fieldName: value});
  }


  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController _controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _controller.text = picked.format(context);
      });
    } else {
      _controller.text = TimeOfDay.now().format(context);
    }
  }

  Future<void> _showAddEventDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'create_reminder'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: calendarColor,
              fontSize: 20,
              fontFamily: 'abel',
            ),
          ),
          content: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _titleController,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Invalid Field";
                  },
                  decoration: InputDecoration(
                    labelText: 'content'.tr,
                    labelStyle: TextStyle(
                      color: calendarColor,
                      fontFamily: 'abel',
                      fontSize: 18,
                    ),
                    hintText: 'Ex: Learn Video',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _timeController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'time'.tr,
                    labelStyle: TextStyle(
                        color: calendarColor, fontFamily: 'abel', fontSize: 18),
                    hintText: 'Select time',
                  ),
                  onTap: () {
                    _selectTime(context, _timeController);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'cancel'.tr,
                style: TextStyle(fontSize: 18, color: redColor),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _timeController.text.isEmpty) {
                  showFailureToast(
                      context, 'required_field'.tr);

                  return;
                } else {

                  setState(() {
                    if (mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                        null) {
                      mySelectedEvents[
                              DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                          ?.add({
                        "id": mySelectedEvents[
                                DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                            ?.length,
                        "eventTitle": _titleController.text,
                        "eventTime": _timeController.text,
                      });
                    } else {
                      mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                        {
                          "id": 0,
                          "eventTitle": _titleController.text,
                          "eventTime": _timeController.text,
                        }
                      ];
                    }
                  });
                  var content = _titleController.text;
                   updateField('users', uId, 'time_notice', mySelectedEvents);
                  _titleController.clear();
                  _timeController.clear();
                  Navigator.pop(context);
                  showNotification(content);
                  return;
                }
              },
              child: Text(
                'save'.tr,
                style: TextStyle(fontSize: 18, color: primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditEventDialog(
    BuildContext context,
    int id,
    String content,
    String time,
  ) async {
    final TextEditingController _editContentController =
        TextEditingController(text: content);
    final TextEditingController _editTimeController =
        TextEditingController(text: time);
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'edit_reminder'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: calendarColor,
                fontSize: 20,
                fontFamily: 'abel',
              ),
            ),
            content: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _editContentController,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: InputDecoration(
                      labelText: 'content'.tr,
                      labelStyle: TextStyle(
                        color: calendarColor,
                        fontFamily: 'abel',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _editTimeController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'time'.tr,
                      labelStyle: TextStyle(
                          color: calendarColor,
                          fontFamily: 'abel',
                          fontSize: 18),
                    ),
                    onTap: () {
                      _selectTime(context, _editTimeController);
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'cancel'.tr,
                  style: TextStyle(fontSize: 18, color: redColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_editContentController.text.isEmpty ||
                      _editTimeController.text.isEmpty) {
                    showFailureToast(
                        context, 'required_field'.tr);

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('required title'),
                    //     duration: Duration(seconds: 2),
                    //   ),
                    // );
                    return;
                  } else {
                    // print(_editContentController.text);
                    // print(_editTimeController.text);

                    setState(() {
                      mySelectedEvents[DateFormat('yyyy-MM-dd')
                              .format(_selectedDate!)]![id]['eventTitle'] =
                          _editContentController.text;
                      mySelectedEvents[DateFormat('yyyy-MM-dd')
                              .format(_selectedDate!)]![id]['eventTime'] =
                          _editTimeController.text;
                    });

                    _titleController.clear();
                    _timeController.clear();
                    _editContentController.clear();
                    _editTimeController.clear();
                    Navigator.pop(context);
                    return;
                  }
                },
                child: Text(
                  'save'.tr,
                  style: TextStyle(fontSize: 18, color: primaryColor),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 395,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(244, 248, 252, 0.8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(76, 98, 118, 0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                )
              ]),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime(2023),
                lastDay: DateTime(2024),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDate, selectedDay)) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                eventLoader: _listOfDayEvents,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          width: MediaQuery.of(context).size.width - 20,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: calendarColor, width: 1),
          ),
          child: _listOfDayEvents(_selectedDate!).length == 0
              ? NoReminderBox()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ..._listOfDayEvents(_selectedDate!)
                          .map((myEvents) => ReminderBox(
                                title: myEvents['eventTitle'],
                                time: myEvents['eventTime'],
                                editReminder: () async {
                                  await _showEditEventDialog(
                                      context,
                                      myEvents['id'],
                                      myEvents['eventTitle'],
                                      myEvents['eventTime']);
                                },
                              ))
                    ],
                  ),
                ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: calendarColor,
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(244, 248, 252, 1),
                  size: 25,
                ),
                onPressed: () async {
                  await _showAddEventDialog(context);
                },
              ),
            ),
            const SizedBox(
              width: 40,
            )
          ],
        ),
      ],
    );
  }
}
