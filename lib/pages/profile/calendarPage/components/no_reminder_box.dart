import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class NoReminderBox extends StatelessWidget {
  const NoReminderBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.notifications_off_outlined,
            color: calendarColor,
            size: 40,
          ),
          SizedBox(height: 5),
          Text(
            "No reminders",
            style: TextStyle(
                color: calendarColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "There are no reminders in this day.",
            style: TextStyle(color: calendarColor, fontSize: 12),
          )
        ],
      ),
    );
  }
}
