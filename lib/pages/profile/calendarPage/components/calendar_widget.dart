import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/no_reminder_box.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/reminder_box.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

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

  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-04-26": [
        {"eventTitle": "Learn topic: Basic"},
        {"eventTitle": "Learn grammar: simple tense"}
      ],
      "2023-04-29" : [
        {"eventTitle": "Learn topic: Class"},
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

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'Add New Reminder',
                textAlign: TextAlign.center,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('required title'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    } else {
                      print(titleController.text);

                      setState(() {
                        if (mySelectedEvents[DateFormat('yyyy-MM-dd')
                            .format(_selectedDate!)] !=
                            null) {
                          mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                              ?.add({
                            "eventTitle": titleController.text,
                          });
                        } else {
                          mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                            {
                              "eventTitle": titleController.text,
                            }
                          ];
                        }
                      });

                      print(
                          "New Event for backend developer ${json.encode(mySelectedEvents)}");
                      titleController.clear();
                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    int height = 30;
    return Column(
      children: [
        Container(
          height: 395,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(244, 248, 252, 0.8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(76, 98, 118, 0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1))
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
        SizedBox(
          height: 10,
        ),
        Container(
          height: 130,
          width: MediaQuery.of(context).size.width - 20,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: calendarColor, width: 1),
          ),

          child: _listOfDayEvents(_selectedDate!).length == 0 ? NoReminderBox() : SingleChildScrollView(
            child: Column(
              children: [
                ..._listOfDayEvents(_selectedDate!).map((myEvents) => ReminderBox(title: myEvents['eventTitle'],))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: calendarColor,
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Color.fromRGBO(244,248,252,1),
                  size: 25,
                ),
                  onPressed: () => _showAddEventDialog(),
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),

      ],
    );
  }
}
