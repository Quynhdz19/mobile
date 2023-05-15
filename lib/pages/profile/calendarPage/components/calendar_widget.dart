import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/no_reminder_box.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/reminder_box.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/toast/showToast.dart';

class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};
  TextEditingController _timeController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-04-26": [
        {"id": 0, "eventTitle": "Learn topic: Basic", "eventTime": "09:00"},
        {
          "id": 1,
          "eventTitle": "Learn grammar: simple tense",
          "eventTime": "09:00"
        }
      ],
      "2023-04-29": [
        {"id": 0, "eventTitle": "Learn topic: Class", "eventTime": "09:00"},
      ]
    };
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

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('required title'),
                  //     duration: Duration(seconds: 2),
                  //   ),
                  // );
                  return;
                } else {
                  // print(_titleController.text);
                  // print(_timeController.text);

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

                  // print(
                  //     "New Event for backend developer ${json.encode(mySelectedEvents)}");
                  _titleController.clear();
                  _timeController.clear();
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

                    // print(
                    //     "New Event for backend developer ${json.encode(mySelectedEvents)}");
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
